class GithubFetchAllReadmesJob
  include Sidekiq::Worker

  def perform
    Package.where("github_url IS NOT NULL").find_each do |package|
      GithubFetchReadmeJob.perform_async(package.id)
    end
  end
end
