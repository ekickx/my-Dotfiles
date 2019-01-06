export ZPLUG_HOME=$HOME/.zplug
cat ~/.cache/wal/sequences
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
zplug "lib/directories", from:oh-my-zsh

# for speed debug. mine ? 230ms, not bad tho
# zplug "paulmelnikow/zsh-startup-timer"

# naisu minimal theme
PURE_PROMPT_SYMBOL='➜ '
zplug 'mafredri/zsh-async', from:github
zplug 'sinetoami/purien', use:purien.zsh, from:github, as:theme

# another eyecandy
zplug 'zdharma/fast-syntax-highlighting', defer:2, hook-load:'FAST_HIGHLIGHT=()'
zplug 'zsh-users/zsh-autosuggestions'

# finally install and load those plugins
zplug check || zplug install
zplug load

# returning command and folder completion when line is empty
# like a bash, but better
blanktab() { [[ $#BUFFER == 0 ]] && CURSOR=3 zle list-choices || zle expand-or-complete }
zle -N blanktab && bindkey '^I' blanktab

# load my own aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
