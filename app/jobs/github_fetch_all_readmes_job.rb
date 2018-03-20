class GithubFetchAllReadmesJob
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options \
    :retry => 5,
    :queue => :github

  sidekiq_throttle({
    :concurrency => { :limit => 1 },
    :threshold => { :limit => 1, :period => 10.seconds }
  })

  def perform
    Package.where("github_url IS NOT NULL").find_each do |package|
      GithubFetchReadmeJob.perform_async(package.id)
    end
  end
end
