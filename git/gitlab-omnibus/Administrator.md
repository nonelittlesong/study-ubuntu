# 一、 配置 GitLab

## 1、 时区
1. 查看时区: `sudo gitlab-rake time:zones:all`  

2. TZInfo: `timedatectl list-timezones`  

3. `sudo vim /etc/gitlab/gitlab.rb`:  
   ```rb
   gitlab_rails['time_zone'] = 'America/New_York'
   ```
