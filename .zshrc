# Custom
alias editzsh="vim ~/.zshrc"

# Navigation
alias server="cd ~/src/server"
alias src="cd ~/src"
alias home="cd ~"
alias dropins="cd ~/src/dropins-components"
alias tesla="cd ~/src/cmde-tesla"
alias open="open https://meta-brogers-dbx.dev.corp.dropbox.com/"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="clean"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions sudo web-search jsontools)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#c78feb'

source $ZSH/oh-my-zsh.sh

# User configuration

# Prompt
function git_branch_name
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('%{$fg_no_bold[cyan]%}$branch%{$reset_color%}')'
  fi
}

function get_pwd
{
  print -rD $PWD
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
PROMPT='%{$fg[magenta]%}%B$(get_pwd)/%b%{$reset_color%} $(git_branch_name) %(!.#.$) '

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
