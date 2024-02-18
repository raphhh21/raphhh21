# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="risto"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# z-plug section start
#source ~/.zplug/init.zsh
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#zplug "jeffreytse/zsh-vi-mode"
#zplug "b4b4r07/zsh-vimode-visual", defer:3
#zplug load --verbose
# z-pulg section end


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting vi-mode zsh-vimode-visual zsh-fzf-history-search)


# edited by me
# user source-ing for plugins
# source ~/.zsh/vi-mode/vi-mode.zsh

## User configuration below

# zsh-vi-mode cursor settings
ZVM_CURSOR_STYLE_ENABLED=true
export VI_MODE_SET_CURSOR=true
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
# trying to autostart tmux
alias tmux="/opt/homebrew/bin/tmux"
ZSH_TMUX_AUTOSTART=false

source $ZSH/oh-my-zsh.sh


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# global alias
alias -g G="| grep"
alias -g L="| less"

alias l="ls -la"
alias nv="nvim"
alias v="nvim"
alias co="codium"
alias cdoc="cd ~/Documents/ocdt/_sem/"
alias t="tmux"
alias smpv='() { streamlink --player mpv $1 best ;}'
alias mpvnvl='mpv --no-video --loop'
alias brewup="brew cu && brew update && brew upgrade --formula"
alias pts="python"

# history control config by me
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS


# user-made sourcing stuff
# path for meee
export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$PATH:/opt/metasploit-framework/bin
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"


# edited by me
# again, try to autostart tmux
# if [ "$TMUX" = "" ]; then exec tmux; fi
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# https://gist.github.com/bashbunni/3880e4194e3f800c4c494de286ebc1d7
# study pomodoro timer aliases
declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  say "'$val' session started"
  timer ${pomo_options["$val"]}m
  say "[[volm 10]]'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

# nvm config
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.1


# Java home config
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set rtp+=/opt/homebrew/opt/fzf
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# add qt@5 to path
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"