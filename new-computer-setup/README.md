#COMPUTER SETUP

## General Setup

- English, US, Eleven-2 pass: eleven2012
- Don't transfer
- Don't Sign in
- fill data, use password, don't leave blank
- languages: System Preferences->Keyboard->Input Sources->(+)-> Bulgarian phonetic

##Terminal Setup

- launch terminal:
- open terminal.txt and copy data. 
```$ vim ~/.bash_profile```
- type i, paste, ESC, :wq, ENTER

```
$ curl -sL https://raw.githubusercontent.com/djl/vcprompt/master/bin/vcprompt > ~/bin/vcprompt
$ chmod 755 ~/bin/vcprompt
$ echo "export PATH=$PATH:~/bin" >>  ~/.bash_profile && source ~/.bash_profile

$ echo "eval "$(rbenv init -)" >> ~/.bash_profile && source ~/.bash_profile

$ cd ~
$ mkdir www

$ mkdir .ssh
$ ssh-keygen -t rsa -C "your_email@example.com"
$ echo "ssh-add ~/.ssh/id_rsa" >>  ~/.bash_profile && source ~/.bash_profile

$ sudo pip install virtualenv
```

ALT+TAB to Finder, press CMD+N, drag the www to the sidebar, for easy access
ALT+TAB to Finder, press CMD+, choose www instead of "All My Files", so "www" loads instead of "All my files"

Preparation:
```
$ sudo npm install -g less
$ sudo pip install flake8
$ sudo npm install -g jshint
$ sudo npm install -g gulp
$ curl https://raw.githubusercontent.com/TwoGears/tg-guides/master/sublime-text/jshint.rc > ~/www/jshint.rc
```

Command Line Tools
```$ gcc```
then click install or get XCODE

##PIP

- download https://bootstrap.pypa.io/get-pip.py
```$ sudo python get-pip.py```

## Heroku accounts for multiple heroku accounts
```
$ heroku plugins:install git://github.com/ddollar/heroku-accounts.git
$ heroku accounts:add account_name
```
Now you need to copy-paste the code it gave you to `~/.ssh/config` and also replace the `PATH/TO/PRIVATE/KEY` with the real path to your real new or old key

## Homebrew
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor
```

##Programs:

General instructions: download, open DMG, drag icon to applications, dbl click applications, drag application in dock. Eject disk, delete dmg.
- chrome, download english English!!
- skype: 
- viber
- firefox
- toggl
- google drive
- utorrent
- sequelpro

##SourceTree

- download sourcetree
- download license from here
- run sourcetree: SourceTree->Registration->Import the license


##PostGres + Admin

- postgresapp.com - download
- unzip
- double click, "move to Applications"
- pgadmin download, open, drag to applications and dock

##NodeJS

- nodejs.com: download

##SublimeText 3

- download sublime 3
- copy text from: packagecontrol.io/installation
- CTRL+~ for console in sublime, paste and enter
- reopen sublime
- SHIFT+CMD+P-> install package
- "emmet", "less", "less2css", "sublimelinter", "Sublimelinter-jshint", "sublimelinter-flake8" 
- Preferences>Package Setting>less2css>settings user:
- restart sublime
- Preferences>Browse Packages...>user. paste here settigns SublimeLinter.settings


## Other
- adobe suite
- ms Office
