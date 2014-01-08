for config_file ($ZSH_PLUGINS/lib/*.zsh $ZSH_PLUGINS/plugins/*.zsh); do
  source $config_file
done

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Theme
source $ZSH_PLUGINS/themes/main.zsh-theme

# Paths
machine=`uname -s`
for path_file ($ZSH_PLUGINS/paths/common/*.zsh $ZSH_PLUGINS/paths/$machine:l/*.zsh); do
  source $path_file
done

#
# MAIN CONF
#
export EDITOR="vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt auto_name_dirs

# URL Magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt interactive_comments

# Delete key fix
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Search
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' history-incremental-search-backward
bindkey '^[[B' history-incremental-search-forward
