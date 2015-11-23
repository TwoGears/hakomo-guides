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

##################
# Path variables #
##################

PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$HOME/www/cake/lib/Cake/Console:$PATH


export EDITOR=vim
print_before_the_prompt () {
        printf "\n$txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
# PS1=''

source .profile

###########
# Aliases #
###########

alias showme="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideme="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias ll="ls -la"
alias cd..="cd .."
alias mkdir="mkdir -pv"
alias reloadbash="source ~/.bash_profile"


#############
# Functions #
#############
#
function actdjango() {
    # Activates a django project
    # by activating it's virtual environment
    # and running the dev server
    #
    # Assumes the directory structure is as below:
    #   www/
    #       projectnameDEV/
    #           venv/..
    #           projectname/..
    if [ "$#" -lt 1 ]
    then
        echo "You must provide a project name"
    else
        if [ $2 ]; then
            dir="/Users/$USER/www/$2DEV/"
        else
            dir="/Users/$USER/www/$1DEV/"
        fi

        cd $dir;
        source venv/bin/activate;
        cd $1;
        python manage.py runserver;
    fi

    return 0
}

function dj() {
    # Runs manage.py commands with less keystrokes
    #
    # (Could have just aliased "python manage.py")
    #
    # Has convenient shortcuts for the most used commands:
    #  - run => runserver
    #  - make => makemigrations
    #  - mg => migrate
    #  - collect => collectstatic witch ignores node_modules folder
    #
    # If the first argument is "act", runs actdjango with
    # the second argument (if any)

    if [ "$1" == "act" ]
    then
        actdjango $2 $3;
    else
        if [ -a manage.py ]
        then
            if [ "$#" -ne 1 ]
            then
                echo "What do you want to do with the project?"
            else
                case $1 in
                    run) python manage.py runserver;;
                    make) python manage.py makemigrations;;
                    mg) python manage.py migrate;;
                    collect) python manage.py collectstatic -i node_modules;;
                    *) python manage.py $1;;
                esac
            fi
        else
            echo "You are not in a django project"
        fi
    fi

    return 0
}

function rr() {
    # Moves files/directories to the trash

    if [ -a $1 ]
    then
        mv $1 ~/.Trash/
    else
        echo "File/folder not found."
    fi

    return 0
}

###########
# Exports #
###########

# EXPORTS here
export DEV="True"

# Other exports...

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
