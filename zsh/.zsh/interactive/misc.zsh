# Smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Jobs
setopt long_list_jobs

# Default programs 
export PAGER=less
export EDITOR=vi
