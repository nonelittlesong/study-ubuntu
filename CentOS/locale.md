# Locale
决定语言、国家、格式和字符编码的一个环境变量。  

<details>
<summary>Resources</summary>

- [How to Change or Set System Locales in Linux](https://www.tecmint.com/set-system-locales-in-linux/)  

</details>

## 查看 Locale
```
[root@vultrguest ~]# locale

locale: Cannot set LC_ALL to default locale: No such file or directory
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC=zh_CN.UTF-8
LC_TIME=zh_CN.UTF-8
LC_COLLATE="en_US.UTF-8"
LC_MONETARY=zh_CN.UTF-8
LC_MESSAGES="en_US.UTF-8"
LC_PAPER=zh_CN.UTF-8
LC_NAME=zh_CN.UTF-8
LC_ADDRESS=zh_CN.UTF-8
LC_TELEPHONE=zh_CN.UTF-8
LC_MEASUREMENT=zh_CN.UTF-8
LC_IDENTIFICATION=zh_CN.UTF-8
LC_ALL=


[root@vultrguest ~]# localectl status

   System Locale: LANG=en_US.UTF-8
       VC Keymap: us
      X11 Layout: us


# 查看详情
[root@vultrguest ~]# locale -k LC_TIME

locale: Cannot set LC_ALL to default locale: No such file or directory
abday="Sun;Mon;Tue;Wed;Thu;Fri;Sat"
day="Sunday;Monday;Tuesday;Wednesday;Thursday;Friday;Saturday"
abmon="Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec"
mon="January;February;March;April;May;June;July;August;September;October;November;December"
am_pm="AM;PM"
d_t_fmt="%a %b %e %H:%M:%S %Y"
d_fmt="%m/%d/%y"
t_fmt="%H:%M:%S"
t_fmt_ampm="%I:%M:%S %p"
era=
era_year=""
era_d_fmt=""
alt_digits=
era_d_t_fmt=""
era_t_fmt=""
time-era-num-entries=0
time-era-entries=""
week-ndays=7
week-1stday=19971130
week-1stweek=4
first_weekday=1
first_workday=2
cal_direction=1
timezone=""
date_fmt="%a %b %e %H:%M:%S %Z %Y"
time-codeset="ANSI_X3.4-1968"
alt_mon="January;February;March;April;May;June;July;August;September;October;November;December"
ab_alt_mon="Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec"


# 查看所有可用的 locale
[root@vultrguest ~]# locale -a

C
C.utf8
en_AG
en_AU
en_AU.utf8
en_BW
en_BW.utf8
en_CA
en_CA.utf8
en_DK
en_DK.utf8
en_GB
en_GB.iso885915
en_GB.utf8
POSIX

```


## 设置 Locale
```sh
# The following command sets LANG to en_IN.UTF-8 and removes definitions for LANGUAGE.
$ sudo update-locale LANG=LANG=en_IN.UTF-8 LANGUAGE
# OR
$ sudo localectl set-locale LANG=en_IN.UTF-8

# To configure a specific locale parameter, edit the appropriate variable. For instance.
$ sudo update-locale LC_TIME=en_IN.UTF-8
# OR
$ sudo localectl set-locale LC_TIME=en_IN.UTF-8
```

全局 locale 设置文件：  
- /etc/default/locale — on Ubuntu/Debian
- /etc/locale.conf — on CentOS/RHEL

为个人设置，打开 `~/.bash_profile`，添加：  
```sh
LANG="en_IN.utf8"
export LANG
```

