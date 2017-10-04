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

export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects

# Arch Linux vs Ubuntu/Debian
if [[ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]
then
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
if [[ -e /usr/bin/virtualenvwrapper.sh ]]
then
	source /usr/bin/virtualenvwrapper.sh
fi

GIT_PROMPT_EXECUTABLE="haskell"
source /home/kaarel/dotfiles/zsh-git-prompt/zshrc.sh
PROMPT='%B%(?..[%?] )%b%n@%U%m%u$(git_super_status)> '

export EDITOR="vim"

randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;}
if [[ -e /home/kaarel/.dir_colors/dircolors ]]
then
	eval `dircolors /home/kaarel/.dir_colors/dircolors`
fi
