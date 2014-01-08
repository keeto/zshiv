#
# ALIASES
#

# Source Editing
alias zp="vim ~/.zshrc"
alias reload="source ~/.zshrc; echo -e \"Profile Reloaded\""

# Aliases
alias cdgit='cd $(git rev-parse --show-toplevel)'
alias serv="python -m SimpleHTTPServer"

# Txtutil
alias chtml="textutil -convert txt *.html; rm *.html;"
alias chtm="textutil -convert txt *.htm; rm *.htm"
