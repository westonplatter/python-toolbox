- [x] setup important routes
- [ ] setup the theme,
  - [x] layout
  - [x] header
  - [ ] footer

- [x] install sidekiq

- [ ] create basic models
  - [x] repo, may have a package
  - [ ] author
  - [x] release, belongs to a package
  - [x] package, has many releases

- [ ] setup rails app server
  - [ ] get nginx setup
  failed: [107.170.203.235] (item=nginx) => {"cache_update_time": 1510569663, "cache_updated": false, "changed": false, "failed": true, "item": "nginx", "msg": "'/usr/bin/apt-get -y -o \"Dpkg::Options::=--force-confdef\" -o \"Dpkg::Options::=--force-confold\"     install 'nginx'' failed: E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)\nE: Unable to lock the administration directory (/var/lib/dpkg/), are you root?\n", "rc": 100, "stderr": "E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)\nE: Unable to lock the administration directory (/var/lib/dpkg/), are you root?\n", "stderr_lines": ["E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)", "E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?"], "stdout": "", "stdout_lines": []}

- [ ] deploy v1

- [ ] fetch python repos from github

- [ ] create python pypi client
