# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/refeeds/.local/bin:$PATH
export PATH=/opt/flutter/bin:$PATH
export PATH=/home/refeeds/go/bin:$PATH
export PATH=/home/refeeds/.cargo/bin:$PATH
export EDITOR=vim

# Path to your oh-my-zsh installation.
export ZSH="/home/refeeds/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Vte config https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias p="ping 8.8.8.8"
#alias s="startx"
alias gpum="git pull upstream master"
alias ppjson="python3 -m json.tool"
alias dmesgw="tail -fn300 /var/log/messages"
alias nik="echo 'JnHIBd1N4/Pq0HeHFk/s8bb6cR5mHqGIVUy6mDxvt3g0niWkRXlAurNdCRTdMTPaX6rz45Ifvugz
0jT91mzPF7iVIzzjUVN9ZfsutGDO2t2BE7oO6JYs8BS6psuF/ry9wrOotBd4flhD+AxUnre/QFJ9
b5F7kQxOo+/0o+w/YVmy7sm51ScIznK/WJjzWUKW7ftmi+IbRSBblwWx/t5IUlxawsg0EUVoNrsg
Fy24i+BpZMQfaSYUEJJNfcmO9Dk7cAHx4cwrOW8FcmnAdfdlPKKPaXcsSvyJivJuWPswqstdYnPP
PBpVIuRuVBT59N17nQ56d3MODNol5qjCYc0OS2ezuwjYJ2FT4HLHHLY23zhnCVyADcbHICxdkq7d
ibEwJEfqTsccTgGYfSA4/knLpnnYiZoMHxyBctIJKK32FYeN3SYa6eQ7wQP0wfCXEC1/ozE9Jbrj
niIw2lwLQ6eMCaq7FZR+9Hzj3JHfk1KHBkZO6g3uknzeAc31lZSkw8zqBpNyBffTJqeicLPmIAdl
TiVEQjFvWiRnwSH/TZfx6O5ygroQyBQp0cymFkVXzD1reRCboIV4lCBk+tuazRtyuM5RnYOI1Uz6
Ik3YdVsjLEZ6pUJdMHro1ukmlED5RkzUpIwtrnRRmdBof058eq0JLzNDmxJlQvO8bwcyFdsH2PE=' | base64 -d | openssl pkeyutl -decrypt -inkey ~/.ssh/id_rsa"
alias xd="xdg-open"
alias adhyasta="cd /mnt/ba866a63-9b1c-41c7-9e48-c2165ff941dc/refeed/GitHub-old/Adhyasta-GCS-System"
alias hddrefeed="cd /run/media/refeeds/ba866a63-9b1c-41c7-9e48-c2165ff941dc/refeed"
alias m="mtr 8.8.8.8"
alias kuliah="cd /run/media/refeeds/ba866a63-9b1c-41c7-9e48-c2165ff941dc/refeed/refeed/KULIAH/SEMESTER\ 4"
alias gamaforce="cd /run/media/refeeds/ba866a63-9b1c-41c7-9e48-c2165ff941dc/refeed/refeed/KULIAH/GAMAFORCE"
alias nvconf="cd ~/.config/nvim && nvim ."
alias vim="nvim"
# See https://github.com/alacritty/alacritty/issues/3962
alias ssh='TERM=xterm-256color ssh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#echo "Heart is the most important asset that you have."
echo "心は人間の最貴重の事だ"
#echo "Do God's will"
echo "神様の意志をして"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
