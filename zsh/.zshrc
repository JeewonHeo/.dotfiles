# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

echo "exporting /etc/zshrc"
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="aussiegeek"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# echo "exporting /cvmfs/cms.cern.ch"
# # cmssw stuff
# if [ -d /cvmfs/cms.cern.ch ]; then
# export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
# source $VO_CMS_SW_DIR/cmsset_default.sh
# export CMSSW_GIT_REFERENCE=$VO_CMS_SW_DIR/cmssw.git.daily
# export CMSSW_MIRROR=$CMSSW_GIT_REFERENCE
# fi
# 
# echo "exporting /cvmfs/grid.cern.ch"
# # CERN grid setup
# if [ -d /cvmfs/grid.cern.ch ]; then
#   export VO_GRID_DIR=/cvmfs/grid.cern.ch
#   export VOMS_USERCONF=$VO_GRID_DIR/etc/grid-security/vomses
#   export X509_VOMS_DIR=$VO_GRID_DIR/etc/grid-security/vomsdir
#   export X509_CERT_DIR=$VO_GRID_DIR/etc/grid-security/certificates
#   source $VO_GRID_DIR/umd-c7ui-latest/etc/profile.d/setup-c7-ui-example.sh
# fi
# 
# echo "exporting PATHs..."
# export PATH=/pad/jheo/.local/tools/hep-tools:${PATH}
# export PATH=/pad/jheo/.local/tools/cpluostools:${PATH}
# export PATH=/pad/jheo/.local/tools/condoop:${PATH}
# export PATH=/pad/jheo/.local/tools/node/node-v16.20.0-linux-x64/bin:${PATH}
# 
# export PYTHONPATH=/pad/jheo/dileptonsaja:$PYTHONPATH
# export PYTHONPATH=/pad/jheo/.local/tools:$PYTHONPATH
# export PYTHONPATH=/pad/jheo/.local/CMSAnalysisTools:$PYTHONPATH

# Delphes
# export LD_LIBRARY_PATH=$CMSSW_BASE/src/delphes/external/Delphes-3.4.2:$LD_LIBRARY_PATH

# User configuration
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias root="root -l"
# alias ls="exa"
# alias l="ls -lrth"
alias l="exa -lh -s modified"
alias mysql="mysql -u root -p"
alias nvidia-top="nvidia-top.py"
alias gpu-user='ps -up `nvidia-smi -q -x | grep pid | sed -e "s/<pid>//g" -e "s/<\/pid>//g" -e "s/^[[:space:]]*//"`'
alias gcondor_q="condor_q -global -all -const '(requestGPUs > 0)'"
alias gcondor_status="condor_status -compact -constraint 'TotalGpus > 0'"

alias img="termvisage -H left"
alias pdf="termpdf.py"

alias w1='watch -n1'
alias zellij='zellij -l compact'

# appimage
alias vi='nvim.appimage'
alias tmux='tmux.appimage'
alias mamba='micromamba'

# export MANPATH="/usr/local/man:$MANPATH"

set -o vi
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# conda, mamba fix HOSTANME
HOSTNAME="$(hostname)"  # Conda clobbers HOST, so we save the real hostname into another variable.
precmd() {
  OLDHOST="${HOST}"
  HOST="${HOSTNAME}"
}

preexec() {
  HOST="${OLDHOST}"
}

eval "$(starship init zsh)"
export STARSHIP_CONFIG=/pad/jheo/.config/starship/starship.toml
