
# colored prompt
#export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# colored ls
if [ $(uname) == "Darwin" ]
then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

# olibra aliases
alias buildserver-start='aws ec2 start-instances --instance-ids i-088a25bb2b72a9db2 --profile buildserver'
alias buildserver-stop='aws ec2 stop-instances --instance-ids i-088a25bb2b72a9db2 --profile buildserver'


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

# gcc on OSX
export PATH="$HOME/opt/gcc-arm-none-eabi-6-2017-q1-update/bin:$PATH"

# for bond_program_inject.sh
export PATH="$HOME/src/olibra/MCU--merge/scripts:$PATH"

