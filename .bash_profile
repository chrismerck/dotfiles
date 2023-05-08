#!/bin/bash 

# colored prompt
#export TERM="xterm-color"
# Show exit status on failure.
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local curr_exit="$?"

    local BRed='\[\e[0;91m\]'
    local RCol='\[\e[0m\]'

		# Get Virtual Env
		if [[ $VIRTUAL_ENV != "" ]]
				then
					# Strip out the path and just leave the env name
					venv="(${VIRTUAL_ENV##*/})"
		else
					# In case you don't have one activated
					venv=''
		fi

    PS1='${venv}\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;36m\]\w\[\e[0m\]\$ '

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
git config --global user.email "chrismerck@gmail.com"
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

##
# Your previous /Users/cmerck/.bash_profile file was backed up as /Users/cmerck/.bash_profile.macports-saved_2018-09-21_at_13:35:41
##

# MacPorts Installer addition on 2018-09-21_at_13:35:41: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$HOME/usr/OpenWrt-Toolchain-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Darwin-x86_64/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin:$PATH"

export PATH="/Applications/ARM/bin:$PATH"
export PATH="/Users/cmerck/Library/Python/3.7/bin:$PATH"

alias tty.SLAB='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.SLAB_USBtoUART /usr/local/tty.bond'
alias tty.usbserial-142101='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-142101 /usr/local/tty.bond'
alias tty.usbserial-141401='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-141401 /usr/local/tty.bond'
alias tty.usbserial-14201='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-14201 /usr/local/tty.bond'
alias tty.usbserial-14101='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-14101 /usr/local/tty.bond'
alias tty.usbserial-FT3GAXHB1='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-FT3GAXHB1 /usr/local/tty.bond'
alias tty.usbserial-x1='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-*1 /usr/local/tty.bond'
alias tty.usbserial-DM41O4SF1='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-DM41O4SF1 /usr/local/tty.bond'
alias tty.SLAB111='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.SLAB_USBtoUART111 /usr/local/tty.bond'
alias tty.usbserial-142301='sudo rm -f /usr/local/tty.bond ; sudo ln -s /dev/tty.usbserial-142301 /usr/local/tty.bond'

alias bdns='_bdns() { ping -c 1 $1.local | grep PING | awk -F"[()]" '\''{print $2}'\''; }; _bdns '


alias mfm='make -j 3 flash monitor || make'
alias mm='make monitor'
alias mf='make flash'
alias m='make'
alias mr='make run'
alias md='make debug'

# aliases for git
alias gs='git status'
alias ga='git add'
alias gac='git add -u'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcot='git checkout trunk'
alias gcob='git checkout -b'
alias gcl='git clone'
alias gl='git log --graph --oneline --decorate'
alias gla='git log --graph --oneline --decorate --author'
alias gld='git log --graph --oneline --decorate --date'
alias glc='git log --graph --oneline --decorate --committer'
alias glp='git log --graph --oneline --decorate --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --abbrev-commit'
alias glpp='git log --graph --oneline --decorate --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --abbrev-commit --stat'
alias glppp='git log --graph --oneline --decorate --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --abbrev-commit --stat --patch'
alias glpppp='git log --graph --oneline --decorate --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --abbrev-commit --stat --patch --numstat'

alias _='~/Library/Python/3.11/bin/sgpt'

alias bond='python3.11 -m ~/src/olibra/bond-cli/bond'

alias bsh='bond discover && bond select $BOND_ID && OUTPUT=$(bond list | grep $BOND_ID) && TOKEN=$(echo "$OUTPUT" | awk -F"|" "{print \$4}" | tr -d "[:space:]") && python3.11 ~/src/olibra/bond-core/tools/bsh.py --hashes --bond $BOND_ID --token $TOKEN'

#. "$HOME/.cargo/env"
