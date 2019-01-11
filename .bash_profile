# echo is like puts for bash (bash is the program running in your terminal)
echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# Define safeecho for ssh purposes
safeecho() {
    if [[ $- == *i* ]]; then
        echo "$@"
    fi
}

# Load RVM into a shell session *as a function*
# Path for RVM
# source ~/.profile

# Path changes are made non-destructive with PATH=new_path;$PATH   This is like A=A+B so we preserve the old path

# Path order matters, putting /usr/local/bin: before $PATH
# ensures brew programs will be seen and used before another program
# of the same name is called

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful prompt
# The various escape codes that we can use to color our prompt.
RED="\[\e[0;31m\]"
YELLOW="\[\e[1;33m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[1;34m\]"
LIGHT_RED="\[\e[1;31m\]"
LIGHT_GREEN="\[\e[1;32m\]"
WHITE="\[\e[1;37m\]"
LIGHT_GRAY="\[\e[0;37m\]"
COLOR_NONE="\[\e[0m\]"
# \[\e[0m\] resets the color to default color
c_reset=$COLOR_NONE
#  \e[0;31m\ sets the color to red
c_path=$RED
# \e[0;32m\ sets the color to green
c_git_clean=$GREEN
# \e[0;31m\ sets the color to red
c_git_dirty=$RED

# PS1 is the variable for the prompt you see everytime you hit enter
# PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'



# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
  return 0
  fi
  # Grab working branch name
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
  git_color="${c_git_clean}"
  else
  git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

function set_git_branch {
  # Set the final branch string
  BRANCH=`git_prompt`
}

# Return the prompt symbol to use, colorized based on the return value of the previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
   PROMPT_SYMBOL="\$"
  else
   PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
 }

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
   PYTHON_VIRTUALENV=""
  else
   PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
 }

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  if is_git_repository ; then
   set_git_branch
  else
   BRANCH=''
  fi

  # Set the bash prompt variable.
  # `\W` is the pwd
  PS1="${PYTHON_VIRTUALENV}${RED}\W${COLOR_NONE} ${BRANCH}${PROMPT_SYMBOL} "
 }

export PROMPT_COMMAND=set_bash_prompt
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Set vim as the default editor
export EDITOR="emacs"
export GIT_EDITOR="emacs"

# Useful aliases
alias be="bundle exec"
alias pr="pipenv run"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
