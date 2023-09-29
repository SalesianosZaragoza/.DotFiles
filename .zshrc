# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation. 
export ZSH=~/.oh-my-zsh
ZSH_THEME=""

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-vi-mode git gh aws microk8s npm nvm pip tmuxinator ubuntu jenv  fzf mvn fasd zsh-completions zsh-syntax-highlighting vagrant docker docker-compose vagrant-prompt kubectl git-flow gitfast command-not-found copypath copybuffer copyfile git-prompt dotenv colorize colored-man-pages zsh-history-substring-search extract sudo gitignore terraform dotenv )
if [[ -z "${BLIND}" ]]; then
  plugins+=(zsh-autosuggestions)
fi
fpath+=$HOME/.zsh/pure
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#autoload -U compinit && compinit
autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
ZVM_VI_EDITOR="nvim"
# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes
source $ZSH/oh-my-zsh.sh
prompt pure
# User configuration
source $HOME/.aliases
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# BEGIN ANSIBLE MANAGED BLOCK for linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
# END ANSIBLE MANAGED BLOCK for linuxbrew

export BREW_HOME="/home/linuxbrew/.linuxbrew"
export JAVA_OPTIONS=$JAVA_OPTIONS" -Xmx4096m -Xms4096m"
# export PYTHONPATH=/usr/lib/python3/dist-packages/:~/.local/lib/python3.7/site-packages:/usr/lib/python3.7/
export ANDROID_HOME=~/SDK/ANDROID/
export BREW_HOME=~/../linuxbrew/.linuxbrew/
alias awscli='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
alias remoteDebugOn="export MAVEN_OPTS='-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000  -Xmx4096m -Xms4096m -XX:+AllowEnhancedClassRedefinition -XX:HotswapAgent=fatjar'"
alias remoteDebugOff='unset MAVEN_OPTS'
alias jhotswap="export JAVA_HOME=$HOME/hotswap/jbr-17.0.5-linux-x64-b653.6 && export PATH=$JAVA_HOME/bin:$PATH"
unalias grv
fpath=(~/.zsh.d/ $fpath)
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/targets/x86_64-linux/lib/:/usr/lib/python3/dist-packages/
export GTAGSLABEL=pygments
export NNN_PLUG='o:fzopen;p:preview-tui;t:preview-tabbed;i:imgthumb'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_SEL='/tmp/.sel'
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_OPENER="nuke"
export NVM_DIR="$HOME/.nvm"
if grep "microsoft" /proc/version >> /dev/null ; then
    echo "Ubuntu on Windows"
  elif grep "generic" /proc/version >> /dev/null; then
    echo "Generic Linux"
  else
    echo "Raspberry Linux"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# BEGIN ANSIBLE MANAGED BLOCK for jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# END ANSIBLE MANAGED BLOCK for jenv

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  [ -s "$NVM_DIR/zsh_completion" ] && . "$NVM_DIR/zsh_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

if [ $commands[gh] ]; then
  source <(gh completion --shell zsh)
fi
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"
export PATH=$CMAKE_HOME/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$SALESFORCE_HOME/bin:$ECLIPSE_HOME/:$HOME/TOOLS/grv/:$PATH
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH:~/.local/bin:/snap/bin:$BREW_HOME/bin
export PATH="$HOME/.jenv/bin:$HOME/go/bin:$PATH"
eval $(thefuck --alias)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--preview "batcat --style=numbers --color=always --line-range :200 {}"'
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
nvm use 19
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  eval "$(github-copilot-cli alias -- "$0")"
