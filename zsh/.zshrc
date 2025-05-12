# echo "exporting /etc/zshrc"
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# omz setting
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    )
source $ZSH/oh-my-zsh.sh

path+=(
  $HOME/.local/bin
  $HOME/.local/tools/condoop
  $HOME/.local/tools/hep-tools
  $HOME/.local/tools/cpluostools
  $HOME/.local/tools/node/node-v16.20.0-linux-x64/bin
  $HOME/.local/CMSAnalysisTools
)
typeset -U path
export PATH

export PYTHONPATH=$HOME/dileptonsaja:$PYTHONPATH
export PYTHONPATH=$HOME/.local/tools:$PYTHONPATH

# env setup
alias cmsset="source $HOME/env_setup/cmssw_setup.sh"
alias gridset="source $HOME/env_setup/grid_setup.sh"
alias rucioset="source $HOME/env_setup/rucio_setup.sh"
alias combineset='cmsset && cd $HOME/Combine/src && cmsenv && cd -'
alias ruciols="rucio rule list -a jheo"

# User configuration
alias rm="rm -i" mv="mv -i" cp="cp -i"
alias l="exa -lh -s modified"
alias root="root -l" # --web=off"
alias gpu-user='ps -up `nvidia-smi -q -x | grep pid | sed -e "s/<pid>//g" -e "s/<\/pid>//g" -e "s/^[[:space:]]*//"`'
alias gcondor_q="condor_q -global -all -const '(requestGPUs > 0)'"
alias gcondor_status="condor_status -compact -constraint 'TotalGpus > 0'"
alias kinit="~/.local/micromamba/bin/kinit"
alias img="convert_img.sh"
alias pdf="termpdf.py"
alias w1='watch -n1'
alias condor_q='condor_q -global -all'
alias cq='condor_q -global -all'
# appimage
alias vi='nvim.appimage'
alias tmux='tmux.appimage'

set -o vi
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/users/jheo/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/users/jheo/.local/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
alias mamba='micromamba'
# <<< mamba initialize <<<

# Rust toolchain
. "$HOME/.cargo/env"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
