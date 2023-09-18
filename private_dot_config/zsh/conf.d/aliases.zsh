#
# Aliases
#

alias ssh-refresh='eval $(keychain --agents ssh --quiet --timeout 270 --eval $(ls ~/.ssh/id_* | grep -v .pub))'

alias grep="command grep --exclude-dir={.git,.vscode}"

# typos
alias cd..='cd ..'
