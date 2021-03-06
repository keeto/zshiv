__show_term_marks(){
	mark=""
	#screen)
	if [[ $TERM = 'screen' ]] then
		mark="%{$BG[178]%}%{$FG[000]%} screen $mark"
	fi
	#ssh)
	if [[ -n $SSH_CLIENT || -n $REMOTEHOST ]] then
		mark="%{$BG[178]%}%{$FG[000]%} ssh $mark"
	fi
	echo $mark
}

__git_ps1_prompt(){
	pr=$(__git_ps1 "%s")
	[ -z "$pr" ] && return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX$pr$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

export LSCOLORS="exHecxdxbxegedabaggxgx"
# PROMPT='%{$reset_color%}%{$FG[015]%}$(__show_term_marks)%{$BG[038]%}%{$FG[000]%} %n@%m %{$BG[243]%}%{$FG[015]%} $(date +%H:%M) %{$BG[240]%}%{$FG[015]%} %~ %{$BG[237]%}$(__git_ps1_prompt)%{$reset_color%}
# %{$FG[038]%}>>%{$reset_color%} '

PROMPT='%{$reset_color%}%{$FG[015]%}$(__show_term_marks)%{$BG[038]%}%{$FG[000]%} %n@%m %{$BG[240]%}%{$FG[015]%} %~ %{$BG[237]%}$(__git_ps1_prompt)%{$reset_color%}
%{$FG[038]%}>>%{$reset_color%} '

precmd() { print "" }


ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$BG[196]%}%{$FG[000]%} dirty %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=") "
