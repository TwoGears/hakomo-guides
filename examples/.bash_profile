txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
        printf "\n$txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PS1='→'

source .profile

eval "$(rbenv init -)"

# =================
# Change Below
# =================

# Aliases
# ===================
alias showme="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideme="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias flushdns_mavericks="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias flushdns="sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches;say flushed"

# Add keys
# ==================
#ssh-add ~/.ssh/id_rsa

# PATHS
# ==================
export PATH=/usr/local/git/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/10/bin:$PATH
export PATH=/Users/pp/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

# Projects Related
# ==================
export DEV=True
export EDITOR=vim

##### REACT NATIVE
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# PROJECT SETUPS
# ==========================

#HAKOMO
export SENDGRID_API_KEY_HAKOMO='XXX'
alias djhakomo="cd ~/www/hakomoDEV/ && source venv/bin/activate && cd hakomo && python manage.py runserver"
alias ghakomo="cd ~/www/hakomoDEV/ && source venv/bin/activate && cd hakomo && gulp"

# Automatically Appended Stuff that needs to be tided up
# ============================
