class Package < ApplicationRecord

  def digest_json_data
    if json_data && json_data['home_page'] && json_data['home_page'].include?("github.com")

      return if source_code_url == json_data['home_page']

      self.update_attributes(source_code_url: json_data['home_page'])
    end
  end

end
