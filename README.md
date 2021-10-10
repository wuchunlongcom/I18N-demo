```
国际化 多国语言  demo

打开终端 --> 点击右边的【终端】；再打开终端 -->【commmond】【T】

快速 进入py375  
$ source  /Users/wuchunlong/local/env375/bin/activate
快速 进入工程目录(/Users/wuchunlong/local/github/I18N-demo)
$ cd /Users/wuchunlong/local/github/I18N-demo
运行
$ ./start.sh
```

```
国际化 多国语言 技术要点

一、应用目标下../I18N-demo/mysite
创建一个目录locale ../I18N-demo/mysite/locale

二、settings.py
LANGUAGE_CODE = 'zh-Hans'
#翻译文件所在目录，需要手工创建
LOCALE_PATHS = (
    os.path.join(os.path.dirname(os.path.abspath(__file__)), "../locale"),
)
TIME_ZONE = 'Asia/Shanghai'
#TIME_ZONE = 'UTC'
USE_I18N = True

三、应用目标下../I18N-demo/mysite
$ django-admin makemessages -l zh_Hans -e py
processing locale zh_Hans  
$ django-admin makemessages -l zh_Hans -e html,txt -e xml
processing locale zh_CN      #产生 django.po

四、../I18N-demo/mysite/locale/zh_Hans/LC_MESSAGES/django.po
# 在文件 django.po 中添加
...
...

msgid "Search System"
msgstr "搜索系统"

msgid "Gaoyu Media"
msgstr "高域传媒"

msgid "Welcome to use a computer."
msgstr "欢迎使用计算机"

msgid "Return"
msgstr "返回首页"

五、../I18N-demo
$ django-admin.py compilemessages   #产生新的django.mo

六、../I18N-demo
$ ./start.sh
```

```
附：最简模板test-i18n.html
<!DOCTYPE html>
{% load i18n %}
<html lang="zh-Hans">
  <head>
    <meta charset="utf-8">
    <title>{% trans 'i18n demo' %}</title> <!--add-->
  </head>
  <body>
       {% trans 'Welcome to use a computer.' %} <!--add-->
  </body>
</html>
```