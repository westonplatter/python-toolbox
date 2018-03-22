class PypiFetchPackageJob
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options \
    :retry => 1,
    :queue => :pypi

  sidekiq_throttle({
    :concurrency => { :limit => 1 },
    :threshold => { :limit => 1, :period => 3.seconds }
  })

  def perform(package_name)
    package = Package.where(name: package_name).first

    if package.nil?
      package = Package.new(name: package_name)
    end

    url = "https://pypi.python.org/pypi/#{package.name}/json"
    response = RestClient.get(url)

    return if (response.code != 200) || (response.body.nil?)

    package.json_data = JSON.parse(response.body)['info'].to_json
    package.save!
    package.digest_json_data

    package.digest_json_data_releases(JSON.parse(response.body)['releases'].to_json)

    package.calculate_stats
  end
end
