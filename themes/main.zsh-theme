__show_term_marks(){
	mark=""
	#screen)
	if [[ $TERM = 'screen' ]] then
		mark="[screen]$mark"
	fi
	#ssh)
	if [[ -n $SSH_CLIENT || -n $REMOTEHOST ]] then
		mark="[ssh]$mark"
	fi
	echo $mark
}

__git_ps1_prompt(){
	pr=$(__git_ps1 "%s")
	[ -z "$pr" ] && return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX$pr$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

export LSCOLORS="exHecxdxbxegedabaggxgx"
PROMPT='
%{$reset_color%}[$(date +%H.%M)]%{$fg[yellow]%}$(__show_term_marks) %{$fg[green]%}%n@%m:%{$fg[blue]%}%{${PWD#$HOME/~}%}%{$reset_color%} $(__git_ps1_prompt)
%# '

ZSH_THEME_GIT_PROMPT_PREFIX="<%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}> %{$fg[red]%}!dirty%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}>"
