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
plugins=(git fzf mvn fasd zsh-completions vagrant docker docker-compose vagrant-prompt kubectl git-flow gitfast command-not-found copydir copybuffer copyfile git-prompt dotenv colorize colored-man-pages zsh-history-substring-search extract sudo gitignore terraform)
fpath+=$HOME/.zsh/pure
autoload -U compinit && compinit
autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes
source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)
prompt pure
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


export CMAKE_HOME="$HOME/TOOLS/cmake/cmake-3.13.0-irc2-Linux-x86_64/"
export JAVA_HOME="/usr/lib/jvm/java-1.14.0-openjdk-amd64/"
#"$HOME/SDK/JDK/java-11-openjdk-hotswap/"
export ECLIPSE_HOME="$HOME/IDE/eclipse-jee"
export MAVEN_HOME="$HOME/TOOLS/apache-maven-3.6.2"
export GRADLE_HOME="$HOME/TOOLS/gradle-5.4.1"
export BREW_HOME="/home/linuxbrew/.linuxbrew"
export PATH=$CMAKE_HOME/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$SALESFORCE_HOME/bin:$ECLIPSE_HOME/:$BREW_HOME/bin:$HOME/TOOLS/grv/:$PATH
export JAVA_OPTIONS=$JAVA_OPTIONS"-Xmx4096m -Xms4096m"
export PYTHONPATH=/usr/lib/python3/dist-packages/:~/.local/lib/python3.7/site-packages:/usr/lib/python3.7/
export ANDROID_HOME=~/SDK/ANDROID/
export BREW_HOME=~/../linuxbrew/.linuxbrew/
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH:$BREW_HOME/bin:~/.local/bin:/snap/bin
alias awscli='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
alias reloadPath='export PATH=$JAVA_HOME/bin:$PATH'
alias remoteDebugOn="export MAVEN_OPTS='-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000 $JAVA_OPTIONS'"
alias remoteDebugOff='unset MAVEN_OPTS'
alias jhotswap="export JAVA_HOME='$HOME/SDK/JDK/java-11-openjdk-hotswap/' && export PATH='$JAVA_HOME/bin:$PATH'"
alias code-sfdx='code --extensions-dir ~/.sfdx-code'
alias code-cpp='code --extensions-dir ~/.cpp-code'
alias code-devops='code --extensions-dir ~/.devops-code'
alias code-python='code --extensions-dir ~/.python-code'
alias code-arduino='code --extensions-dir ~/.arduino-code'
alias code-scala='code --extensions-dir ~/.scala-code'
alias code-node='code --extensions-dir ~/.node-code'
alias code-asm='code --extensions-dir ~/.asm-code'
alias code-sql='code --extensions-dir ~/.sql-code'
alias code-java='code --extensions-dir ~/.java-code'
alias code-php='code --extensions-dir ~/.php-code'

fpath=(~/.zsh.d/ $fpath)
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/targets/x86_64-linux/lib/
export PATH="$HOME/.jenv/bin:$HOME/go/bin:$PATH"
export GTAGSLABEL=pygments
export DOCKER_HOST=tcp://localhost:2375
export NNN_PLUG='o:fzopen'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_SEL='/tmp/.sel'
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_OPENER="nuke"