- [x] setup important routes
- [ ] setup the theme,
  - [x] layout
  - [ ] header
  - [ ] footer

- [x] install sidekiq

- [ ] create basic models
  - [ ] repo, may have a package
  - [ ] author
  - [ ] release, belongs to a package
  - [ ] package, has many releases

- [ ] fetch python repos from github

- [ ] create python pypi client

Package
- name
- created_at
- json_data
- source_code_url
- total_downloads
- score
- releases_json
= upsert_json
= json classifiers -> nested sets

Release
- package_id
- created_at
- key
- json data
= upsert_json
= total_downloads
= json_days_since_upload
= downloads_count
