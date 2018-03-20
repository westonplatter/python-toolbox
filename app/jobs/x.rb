class X
  include Sidekiq::Worker

  def perform
    Package.all.find_each do |package|
      if package.source_code_url
        if package.source_code_url.include?("github.com")
          package.update_attributes(github_url: package.source_code_url)
        end
      end
    end
  end
end
