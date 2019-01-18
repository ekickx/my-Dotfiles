export ZPLUG_HOME=$HOME/.zplug
setopt auto_cd

# zplug initialization
[[ ! -f $ZPLUG_HOME/init.zsh ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# do self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# load nice libs from oh-my-zsh
zplug "lib/completion",   from:oh-my-zsh
zplug "lib/history",      from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh

# for speed debug. mine ? 230ms, not bad tho
zplug "paulmelnikow/zsh-startup-timer"

# naisu minimal theme
# PURE_PROMPT_SYMBOL='➜ '
# zplug 'mafredri/zsh-async', from:github
# zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
# zplug 'tzing/clover.zsh-theme', from:github, as:theme
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# another eyecandy
zplug 'zsh-users/zsh-autosuggestions'
# zplug 'zdharma/fast-syntax-highlighting', defer:2, hook-load:'FAST_HIGHLIGHT=()'

# finally install and load those plugins
zplug check || zplug install
zplug load

# returning command and folder completion when line is empty
# like a bash, but better
blanktab() { [[ $#BUFFER == 0 ]] && CURSOR=3 zle list-choices || zle expand-or-complete }
zle -N blanktab && bindkey '^I' blanktab

# load my own aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Path
export PATH=$PATH":$HOME/.commands"
export PATH=$PATH":$HOME/.local/bin"
NPM_PREFIX="${HOME}/.local/node"

# mencegah duplikat lokasi node packages
if [[ -z $(printf $PATH | grep $NPM_PREFIX/bin) ]]; then
  export PATH="$NPM_PREFIX/bin:$PATH"
fi
