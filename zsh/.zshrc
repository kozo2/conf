# http://devel.aquahill.net/zsh/dot.zshrc
echo "Loading $HOME/.zshrc"

### environment variables
export EDITOR=vim
export GISTY_DIR="$HOME/dev/gists"

# maven
export M2_HOME=$HOME/application/apache-maven-2.2.0
export M2=$M2_HOME/bin

# pax-construct
export PAX_CONSTRUCT_HOME=$HOME/application/pax-construct-1.4
export PAX_CONSTRUCT=$PAX_CONSTRUCT_HOME/bin

# OS dependent variables (Java, Macports, ...)
os_type=`uname`
if [ "$os_type" = "Linux" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-1.5.0-sun
    export JAVA=$JAVA_HOME/bin
    export PATH=$M2:$PAX_CONSTRUCT:$JAVA:$PATH
elif [ "$os_type" = "Darwin" ]; then
    export JAVA_HOME=/Library/Java/Home
    export JAVA=$JAVA_HOME/bin
    export SUBVERSION_HOME=/opt/subversion
    export SUBVERSION=$SUBVERSION_HOME/bin
    # macports
    export MACPORTS_BIN=/opt/local/bin
    export MACPORTS_SBIN=/opt/local/sbin
    export MACPORTS=$MACPORTS_BIN:$MACPORTS_SBIN
    export PATH=$M2:$PAX_CONSTRUCT:$JAVA:$SUBVERSION:$MACPORTS:$PATH
fi

### shell variables
HISTFILE=$HOME/.zsh_history
HISTSIZE=1024
# http://journal.mycom.co.jp/column/zsh/002/index.html
PROMPT="[%n@%m]%~%# "
SAVEHIST=2048
VIMRC=$HOME/.vimrc

### key bindings
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^[/" expand-cmd-path

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# http://hatena.g.hatena.ne.jp/hatenatech/20060517/1147833430
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

source $HOME/.zsh/aliases
source $HOME/.zsh/zshoptions

#
# Default shell configuration
#
autoload -U colors
colors
autoload -U compinit
compinit
autoload predict-on
predict-on

