# Language
export LANG=ja_JP.UTF-8

# Paths
typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
path=(~/bin(N-/) ~/.nodebrew/current/bin(N-/) /usr/local/bin(N-/) /opt/local/bin(N-/) ${path})

# Default editor
export EDITOR="subl -w"

# Cd
setopt auto_cd
cdpath=(.. ~ ~/Projects)
function chpwd() { ls }

# Pushd
setopt auto_pushd
setopt pushd_ignore_dups

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# Exclude root
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

# History search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# Glob
setopt numeric_glob_sort
setopt extended_glob
setopt glob_dots
setopt brace_ccl
setopt equals

# Auto complement
autoload -Uz compinit; compinit
setopt auto_list
setopt auto_menu
setopt complete_aliases
setopt list_packed
setopt list_types
setopt magic_equal_subst
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# Prompt
autoload -Uz colors; colors
setopt prompt_subst
case ${UID} in
0)
  PROMPT="[%{${fg[yellow]}%}%n@%m%{${reset_color}%}] %{${fg[yellow]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[yellow]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[yellow]}%}[%/]%{${reset_color}%}"
  ;;
*)
  PROMPT="[%n@%m] %{${fg[green]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[green]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[green]}%}[%/]%{${reset_color}%}"
  ;;
esac

### Ls Colors ###
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Misc.
setopt interactive_comments
setopt nolistbeep
setopt notify
setopt print_eight_bit

# Global alias
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g S="| sort"

# Alias
alias pu="pushd"
alias po="popd"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

# Auto jump
if [ -f `brew --prefix`/etc/autojump ]; then
. `brew --prefix`/etc/autojump
fi

# Brew cask settings.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"