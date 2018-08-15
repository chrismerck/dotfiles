
# colored prompt
#export TERM="xterm-color"
# Show exit status on failure.
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local curr_exit="$?"

    local BRed='\[\e[0;91m\]'
    local RCol='\[\e[0m\]'

    PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;36m\]\w\[\e[0m\]\$ '

    if [ "$curr_exit" != 0 ]; then
        PS1="[${BRed}$curr_exit${RCol}]$PS1"
    fi
}

# colored ls
if [ $(uname) == "Darwin" ]
then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

alias doaglio="aglio --theme-full-width --theme-variables flatly -i docs/api.apib -o docs/templates/api_docs.html"

source ~/.work_profile

# enter virtualenv
alias activate='source .env/bin/activate'
# deactivate is already created by the above

# global git config
git config --global color.ui true
git config --global core.editor vim
#git config --global push.default simple
git config --global user.name "Chris Merck" 
git config --global user.email "$USER@$HOSTNAME"
git config --global core.excludesfile ~/.gitignore_global
# rebase by default to avoid nasty merge bubbles
git config --global pull.rebase true


# git autocomplete
source ~/.git-completion.bash


###########
# PATH Variable
###########

# cabal path (OSX)
if [ $(uname) == "Darwin" ] 
then
  export PATH="$HOME/Library/Haskell/bin:$PATH"
else
  true #export PATH="$HOME/Library/Haskell/bin:$PATH"
fi

# MacTex path (OSX)
if [ `uname` == "Darwin" ]; then
  export PATH="/usr/texbin:$PATH"
fi

# user path
export PATH="$HOME/bin:$PATH"

# for pip (python installer)
export PATH="$HOME/.local/bin:$PATH"
alias pipi='pip install --user'

# microchip compiler
export PATH="$PATH:/opt/microchip/xc8/v1.36/bin"

# gcc on OSX
export PATH="$HOME/opt/gcc-arm-none-eabi-6-2017-q1-update/bin:$PATH"

export PATH=$PATH:$HOME/esp/xtensa-esp32-elf/bin

# timestamp 
alias ts='python -c '"'"'import sys,time;t=time.time();[sys.stdout.write("[%5.03f] %s"%(time.time()-t,line)) for line in sys.stdin]'"'"''
