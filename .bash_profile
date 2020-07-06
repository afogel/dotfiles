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

# Load bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Set vim as the default editor
export EDITOR="vim"
export GIT_EDITOR="vim"

# Useful aliases
alias ls='ls -Gh'
alias be="bundle exec"
alias vscode='open -a Visual\ Studio\ Code '
alias excel='open -a Microsoft\ Excel'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(starship init bash)"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
