############################## Bash settings ##################################
export red=`tput setaf 1`
export green=`tput setaf 2`
export reset=`tput sgr0`


# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Make bash act more VIMmy
set -o vi
bind '"jj":"\e"'

# Use brew installed vim as the default editor
export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim

############################ History config ###################################

# save history to ~/.bash_history as soon as command is run
export PROMPT_COMMAND='history -a'
shopt -s histappend

# save unlimited history
# osx doesn't seem to respect =-1 or = options
export HISTSIZE=9999999999
export HISTFILESIZE=999999999
export HISTIGNORE="pwd:ls:ls -hal:"
export HISTCONTROL=ignorespace


################################# Prompt ######################################

# terminal settings (Cygwin inspired prompt)
#   davur@macbook [~/Projects/dotfiles]
#   10:14:23 $ |
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
ps1() {
  PS1="\[\e]0;\w\a\]\n\[\e[34m\]\u@\h [\[\e[37m\]\w\[\e[34m\]] \[\e[32m\]\$(parse_git_branch) \[\e[0m\]\n\t \$ "
}
PS1="\n$ "


############################### Shortcuts #####################################

# Preferred flags
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -hal'

alias please='sudo $(fc -ln -1)'
alias prettyjson='python -m json.tool'
alias vi='vim'
alias vif='TMPF=`fzf`; ls $TMPF && vim $TMPF'

# grep but include first N=1 header line(s)
function greph {
  if [[ $# -eq 0 ]]; then
    echo "usage: greph pattern [header-line-count]"
  elif [[ $# -eq 2 ]]; then
    awk "NR<=$2 || /$1/"
  else
    awk "NR==1 || /$1/"
  fi
}

function cheat {
  curl https://cheat.sh/$1
}

# Trash instead of rm
function trash() { echo "mv \"$@\" ~/.Trash/" && mv "$@" ~/.Trash/; }

# Quick backup/restore
function bu () { echo "cp -ri \"$@\" \"$@~\"" && cp -i "$@" "$@~"; }
function ubu () { echo "cp -ri \"$@~\" $@\"" && cp -i "$@~" "$@"; }

# Create and change to dir
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# flip line endings
alias dos2unix="perl -pi -e 's/\r\n?/\n/g'"
alias mac2unix="perl -pi -e 's/\r\n?/\n/g'"
alias unix2dos="perl -pi -e 's/\n/\r\n/g'"
alias unix2mac="perl -pi -e 's/\n/\r/g'"

# log files
alias emaillog='tail -f /private/log/mail_php.log'
alias emaillogclear='echo "" > /private/log/mail_php.log'

# Django
alias makemigrations='echo "python manage.py makemigrations"; python manage.py makemigrations'
alias migrate='echo "python manage.py migrate"; python manage.py migrate'
alias runserver='echo "python manage.py runserver"; python manage.py runserver'

# Docker
alias dosh='alias dosh; docker run -ti --entrypoint /bin/bash -v $(pwd):/tmp'

############################### Tool settings #################################

export PATH="$HOME/homebrew/bin:/usr/local/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#source /usr/local/bin/virtualenvwrapper.sh
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"


old_setup() {
  source ~/.bash/kubernetes.sh
  source ~/Developer/repos/openshift-scratchpad/openshift.sh

  export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
}
archived_setup() {
  export AIRFLOW_HOME=/Users/davurclementsen/OneDrive/Innablr/repos/innablraf/airflow

}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source .bash_profile_work

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# export GOPROXY=https://artifactory.gcp.anz/artifactory/go

alias ctags='/usr/local/bin/ctags'


setup_gcp() {
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/clemend4/google-cloud-sdk/path.bash.inc' ]; then . '/Users/clemend4/google-cloud-sdk/path.bash.inc'; fi
  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/clemend4/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/clemend4/google-cloud-sdk/completion.bash.inc'; fi
}

export JAVA_HOME="$(/usr/libexec/java_home -v 13)"

alias awsokta='alias awsokta; docker run -e OKTA_PROFILE=$AWS_PROFILE -it -v ~/.aws:/root/.aws -v ~/.okta:/root/.okta local/aws-okta-auth:latest'


# From https://stackoverflow.com/a/52524114
## export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
## export JAVA_9_HOME=$(/usr/libexec/java_home -v9)
## export JAVA_10_HOME=$(/usr/libexec/java_home -v10)
## export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
## export JAVA_12_HOME=$(/usr/libexec/java_home -v12)
## export JAVA_13_HOME=$(/usr/libexec/java_home -v13)
## export JAVA_14_HOME=$(/usr/libexec/java_home -v14)
export JAVA_15_HOME=$(/usr/libexec/java_home -v15)

## alias java8='export JAVA_HOME=$JAVA_8_HOME'
## alias java9='export JAVA_HOME=$JAVA_9_HOME'
## alias java10='export JAVA_HOME=$JAVA_10_HOME'
## alias java11='export JAVA_HOME=$JAVA_11_HOME'
## alias java12='export JAVA_HOME=$JAVA_12_HOME'
## alias java13='export JAVA_HOME=$JAVA_13_HOME'
## alias java14='export JAVA_HOME=$JAVA_14_HOME'
alias java15='export JAVA_HOME=$JAVA_15_HOME'

# default to Java 15
java15


export BASH_SILENCE_DEPRECATION_WARNING=1
