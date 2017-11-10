class PypiFetchPackageJob
  include Sidekiq::Worker

  sidekiq_options \
    :retry => 5

  def perform(package_name)
    package = Package.where(name: package_name).first

    if package.nil?
      package = Package.new(name: package_name)
    end

    url = "https://pypi.python.org/pypi/#{package.name}/json"
    response = RestClient.get(url)

    binding.pry

    return if (response.status_code != 200) || (response.body.nil?)

    package.json_data['info'] = response.body
    package.save!

    package.digest_json_data
  end
end
