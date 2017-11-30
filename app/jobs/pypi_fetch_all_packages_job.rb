class PypiFetchAllPackagesJob
  include Sidekiq::Worker

  def perform
    PingSlackJob.perform_async("PypiFetchAllPackagesJob - started")

    html_page = Nokogiri::HTML(open("https://pypi.python.org/simple/"))

    html_page.css("a").each do |link|
      package_name = link.attr("href")
      PypiFetchPackageJob.perform_async(package_name)
    end

    PingSlackJob.perform_async("PypiFetchAllPackagesJob - finished")
  end
end
