autoload -U compinit
compinit

bindkey -v
bindkey "\e[1~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey ' ' magic-space    # also do history expansion on space
