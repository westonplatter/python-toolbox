class GithubFetchReadmeJob
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options \
    :retry => 5,
    :queue => :github

  sidekiq_throttle({
    :concurrency => { :limit => 1 },
    :threshold => { :limit => 1, :period => 10.seconds }
  })

  def perform(package_id)
    package = Package.find(package_id)

    return if package.github_url.blank?

    username = package.extract_github_username
    projectname = package.extract_github_projectname

    readme = Octokit.readme "#{username}/#{projectname}", :accept => 'application/vnd.github.html'

    html = Nokogiri::HTML(readme)

    html.search('.octicon.octicon-link').each do |link|
      link.remove
    end

    package.github_readme = html.to_s
    package.save
  end
end
