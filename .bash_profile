############################## Bash settings ##################################

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Make bash act more VIMmy
export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim
set -o vi

export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=10000

################################# Prompt ###################################### 

# terminal settings (Cygwin inspired prompt)
#   davur@macbook [~/Projects/dotfiles]
#   10:14:23 $ |
PS1="\[\e]0;\w\a\]\n\[\e[34m\]\u@\h [\[\e[37m\]\w\[\e[34m\]]\[\e[0m\]\n\t \$ "


############################### Shortcuts #####################################

# Preferred flags
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -hal'

alias please='sudo $(fc -ln -1)'
alias prettyjson='python -m json.tool'
alias vi='vim'

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

# Trash instead of rm
function rm() { echo "mv \"$@\" ~/.Trash/" && mv "$@" ~/.Trash/; }

# Quick backup/restore 
function bu () { echo "cp -i \"$@\" \"$@~\"" && cp -i "$@" "$@~"; }
function ubu () { echo "cp -i \"$@~\" $@\"" && cp -i "$@~" "$@"; }

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


############################### Tool settings #################################

export PATH=/usr/local/bin:$PATH

export WORKON_HOME=$HOME/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"



export AIRFLOW_HOME=/Users/davurclementsen/OneDrive/Innablr/repos/innablraf/airflow

source ~/.bash/kubernetes
source /Users/davurclementsen/OneDrive/repos/fzf/shell/completion.bash
source /Users/davurclementsen/OneDrive/repos/fzf/shell/key-bindings.bash
