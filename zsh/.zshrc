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
if [[ -e $HOME/.pub-cache/bin ]]
then
	export PATH="$PATH":"$HOME/.pub-cache/bin"
fi

############################################################
# Rust stuff
############################################################
if [[ -e $HOME/.cargo/bin ]]
then
	export PATH="$HOME/.cargo/bin":"$PATH"
fi

############################################################
# JavaScript stuff
############################################################
# yarn binaries
if [[ -e $HOME/.yarn/bin ]]
then
	export PATH="$PATH":"$HOME/.yarn/bin"
fi

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
setopt PROMPT_SP

############################################################
# Keybinding stuff
############################################################
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
