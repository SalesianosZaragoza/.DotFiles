#sh ~/.properscaling.sh  
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation. 
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
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
plugins=(git,zsh-completions)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# User configuration

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
source $ZSH/plugins/fasd/fasd.plugin.zsh
source  $ZSH/plugins/mvn/mvn.plugin.zsh
source $ZSH/plugins/docker-compose/docker-compose.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export CMAKE_HOME="$HOME/TOOLS/cmake/cmake-3.8.0-Linux-x86_64/"
#export JAVA_HOME="$HOME/SDK/JDK/jdk-10.0.2"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export SCALA_HOME="$HOME/TOOLS/scala-2.11.7"
export MAVEN_HOME="$HOME/TOOLS/apache-maven-3.5.4"
export GRADLE_HOME="$HOME/TOOLS/gradle-2.9"
export PATH=$CMAKE_HOME/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$PATH

export REBEL_BASE=$HOME/.jrebel
export REBEL_HOME=$HOME/IDE/eclipse-jee/plugins/org.zeroturnaround.eclipse.embedder_7.1.6.RELEASE/jrebel
export JAVA_OPTIONS=$JAVA_OPTIONS" -agentpath:$REBEL_HOME/lib/libjrebel64.so -Xmx4096m -Xms4096m"
export PYTHONPATH=/usr/lib/python3/dist-packages/
export ANDROID_HOME=~/SDK/ANDROID/
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH

alias remoteDebugOn="export MAVEN_OPTS='-Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000 $JAVA_OPTIONS'"
alias remoteDebugOff='unset MAVEN_OPTS'
alias vim=nvim
alias j10="export JAVA_HOME='$HOME/SDK/JDK/jdk-10.0.2/';export PATH='$JAVA_HOME:$PATH'"
alias j11="export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64/';export PATH='$JAVA_HOME:$PATH'"













