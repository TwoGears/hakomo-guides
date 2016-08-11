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

source ~/.profile

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
alias pipfreeze="pip freeze > requirements.txt"
alias rmpyc="find . -name \*.pyc -delete"

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
            if [ "$#" -lt 1 ]
            then
                echo "What do you want to do with the project?"
            else
                case $1 in
                    run) python manage.py runserver $2;;
                    make) python manage.py makemigrations;;
                    mg) python manage.py migrate;;
                    collect) python manage.py collectstatic -i node_modules;;
                    heroku) heroku run python manage.py $2 $3 $4;;
                    *) python manage.py "$@";;
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

function ask() {
    # Credits: http://djm.me/ask
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question - use /dev/tty in case stdin is redirected from somewhere else
        read -p "$1 [$prompt] " REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

function coloredEcho(){
    # Based on: http://stackoverflow.com/a/23006365
    local exp=$1;
    local color=$2;
    local bgcolor=$3

    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi

    if ! [[ $bgcolor =~ '^[0-9]$' ]] ; then
       case $(echo $bgcolor | tr '[:upper:]' '[:lower:]') in
        black) bgcolor=0 ;;
        red) bgcolor=1 ;;
        green) bgcolor=2 ;;
        yellow) bgcolor=3 ;;
        blue) bgcolor=4 ;;
        magenta) bgcolor=5 ;;
        cyan) bgcolor=6 ;;
        white|*) bgcolor=7 ;; # white or invalid bgcolor
       esac
    fi

    tput setaf $color;

    if [ "$#" -eq  "3" ]
    then
        tput setab $bgcolor;
    fi

    echo $exp;
    tput sgr0;
}

function ionapp() {
    # Setups an ionic app from https://github.com/TwoGears/ionic-seed
    if [ "$#" -ne 1 ]
    then
        coloredEcho "App name missing!" red;
    else
        coloredEcho "Cloning repo..." blue;
        git clone https://github.com/TwoGears/ionic-seed.git

        coloredEcho "Renaming the project to '$1' ..." blue;
        mv ionic-seed $1

        cd $1 && rm -rf .git

        read -p "Git repo: " gitRepo

        if [ -z "$gitRepo" ]; then
            coloredEcho "No git repo provided. Moving on" blue;
        else
            git init
            git remote add origin $gitRepo
        fi

        npm run setup

        coloredEcho "It's best if you rename the app now." yellow;
        coloredEcho "You can now start the app with ionic serve" cyan;
    fi
}

function releaseapp() {
    # Builds for ios and android. Signes and zips android builds.
    # Assumes the project has crosswalk browser installed
    if [ -a ionic.project ]
    then
        coloredEcho "Switching to production environment..." blue

        gulp prod

        coloredEcho "Removing development plugins..." blue
        ionic plugin remove cordova-plugin-console

        if ask "Bump version?" Y; then
            read -p "What to bump? <--patch, --minor, --major or --setversion=0.0.0> " bumpValue
            gulp bump $bumpValue
        fi

        if ask "Build for iOS?" Y; then
            coloredEcho "Building for iOS..." magenta
            ionic build ios
            coloredEcho "!" yellow
            coloredEcho "Don't forget to upload the project from Xcode!" red
            coloredEcho "!" yellow
        fi

        if ask "Build for android?" Y; then
            coloredEcho "Building for android..." cyan

            read -p "Name of the files: " androidNamePrompt

            cordova build --release android -- --minSdkVersion=15

            rr ../$androidNamePrompt-x86.apk
            rr ../$androidNamePrompt-armv7.apk

            jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore platforms/android/build/outputs/apk/folded-release-key.keystore platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk folded-release-key
            jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore platforms/android/build/outputs/apk/folded-release-key.keystore platforms/android/build/outputs/apk/android-x86-release-unsigned.apk folded-release-key

            zipalign -v 4 platforms/android/build/outputs/apk/android-x86-release.apk ../$1-x86.apk
            zipalign -v 4 platforms/android/build/outputs/apk/android-armv7-release.apk ../$1-armv7.apk

            coloredEcho "TODO: Conditions and failsafes"
        fi

        coloredEcho "Switching to development..." blue

        ionic plugin add cordova-plugin-console

        gulp dev


    else
        coloredEcho "You must be in a ionic project folder." red
    fi

    return 0
}

###########
# Exports #
###########

export DEV="True"
# other exports...
# ...


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
