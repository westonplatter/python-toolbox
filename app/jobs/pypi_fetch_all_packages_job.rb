class PypiFetchAllPackagesJob
  include Sidekiq::Worker

  def perform
    # ping slack

    html_page = Nokogiri::HTML(open("https://pypi.python.org/simple/"))

    html_page.css("a").each do |link|
      package_name = link.attr("href")
      PypiFetchPackageJob.perform_async(package_name)
    end

    # ping slack
  end
end
