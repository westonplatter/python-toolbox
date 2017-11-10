
Package.where(name: "django").first.digest_json_data_releases

Package.find_each(:batch_size => 50).map(&:digest_json_data_releases)
