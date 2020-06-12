## 一、 配置 GitLab

### 1、 时区
1. 查看时区: `sudo gitlab-rake time:zones:all`  

2. TZInfo: `timedatectl list-timezones`  

3. `sudo vim /etc/gitlab/gitlab.rb`:  
   ```rb
   gitlab_rails['time_zone'] = 'America/New_York'
   ```

## 二、 维护 GitLab
### 1、 Rake tasks
#### 用户管理
##### \# 添加一个用户作为 developer 到所有项目
```
sudo gitlab-rake gitlab:import:user_to_projects[username@domain.tld]
```
##### \# 添加所有用户到所有项目
```
sudo gitlab-rake gitlab:import:all_users_to_all_projects
```
##### \# 添加一个用户作为 developer 到所有组
```
sudo gitlab-rake gitlab:import:user_to_groups[username@domain.tld]
```
##### \# 添加所有用户到所有组
```
sudo gitlab-rake gitlab:import:all_users_to_all_groups
```


### 2、 Omnibus Gitlab restart & reconfigure

- `sudo gitlab-ctl reconfigure`
- `sudo gitlab-ctl restart [service]`
- `sudo gitlab-ctl status`
- `sudo gitlab-ctl kill <service>`
- `sudo gitlab-ctl stop`
- `sudo gitlab-ctl start`


## 三、 重置管理员密码

```
sudo gitlab-rails console production
user = User.where(id:1).first
user.password='123456'
user.save!
quit
sudo gitlab-ctl reconfigure
```

