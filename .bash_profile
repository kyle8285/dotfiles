source ~/.apikeys

alias dm=docker-machine
alias ls='ls -FG'
alias co='git checkout'
alias api='docker exec -it api'

# env for docker machine
if [[ $(docker-machine status default) == Running ]]; then
  eval "$(docker-machine env default)"
fi

# Jump
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export WORKON_HOME=$HOME/.virtualenvs
# Source virutalenvwrapper executable
source /usr/local/bin/virtualenvwrapper.sh

# command completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git tab completion
if [ -f ~/.git-completion.bash  ]; then
  . ~/.git-completion.bash
fi

# autoenv
source /usr/local/opt/autoenv/activate.sh

# set VIM as default editor
export EDITOR="vim"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function title {
  echo -ne "\033]0;"$@"\007"
}

# set base url for running python dev server locally
export LOCAL_ASSET_HOST="127.0.0.1:5001"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# default command for zfz, fuzzy search for vim
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash