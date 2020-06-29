#% Sets prompt with color exit codes of last command + pwd
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

source ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"

autoload -Uz compinit && compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
