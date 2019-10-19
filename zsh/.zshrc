# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/kaarel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
autoload promptinit
promptinit
prompt walters

############################################################
# Python stuff
############################################################
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects
export PATH="$PATH":"$HOME/.local/bin"
# Virtualenvwrapper
# Ubuntu/Debian
if [[ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]
then
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
# Arch Linux
if [[ -e /usr/bin/virtualenvwrapper.sh ]]
then
	source /usr/bin/virtualenvwrapper.sh
fi

############################################################
# Dart stuff
############################################################
export PATH="$PATH":"$HOME/.pub-cache/bin"

############################################################
# Project management stuff
############################################################
# prm
export RPROMPT=$RPS1
alias prm=". $HOME/dotfiles/prm/prm.sh"
#alias prm=". $HOME/dotfiles/prm/prm.sh"
# git
GIT_PROMPT_EXECUTABLE="haskell"
source /home/kaarel/dotfiles/zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%(?..[%?] )%b%n@%U%m%u$(git_super_status)> '

############################################################
# General ease of use stuff
############################################################
export EDITOR="vim"

randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;}
if [[ -e /home/kaarel/.dir_colors/dircolors ]]
then
	eval `dircolors /home/kaarel/.dir_colors/dircolors`
fi
