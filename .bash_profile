
# colored prompt
#export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# colored ls
alias ls='ls -G'

# git autocomplete
source ~/.git-completion.bash
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# cabal path (OSX)
export PATH="$HOME/Library/Haskell/bin:$PATH"

# MacTex path (OSX)
export PATH="/usr/texbin:$PATH"

