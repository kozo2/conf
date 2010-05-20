echo "Loading ~/projects/dotfiles/bash/bashrc"

# http://iandeth.dyndns.org/mt/ian/archives/000651.html
function share_history {
	    history -a
	    history -c
	    history -r
	}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=8192

shopt -s cdspell

# for version4
# shopt -s autocd
# shopt -s dirspell
# shopt -s globstar

alias gad='git add'
alias gst='git status'
alias gci='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gdf='git diff'

alias sci='svn commit -m'
alias sst='svn status'
alias sdf='svn diff'

alias h=history
alias ll='ls -l'
alias la='ls -A'
alias l='ls --color -la'

# http://blog.bulknews.net/mt/archives/DECON.pdf
alias e='emacs -nw'
alias v=vim
alias m=less
alias j='jobs -l'
alias x=exit
alias where='command -v'
alias su='su -l'

alias df='df -h'
alias du='du -ackh'
alias diff='diff -NBaur'
alias scp='scp -p'

# show the directories or symbolic link of directories
alias lsd='ls -ld *(-/DN)'

# show the files start with "."
alias lsa='ls -ld .*'

# if [ $SHLVL = 1 ]; then
#   tmux attach-session || tmux -f $HOME/projects/dotfiles/tmux/.tmux.conf
# fi

function cd() {
  builtin cd $@
  l
}
