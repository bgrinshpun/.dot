export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PS1="\[\033[1;37m\][\[\033[0;33m\]\u\[\033[1;37m\]|\[\033[0;35m\]\h\[\033[1;37m\]] \[\033[0;36m\]\w \[\033[0;36m\]\$\[\033[0m\] "  # bash prompt default (optimized for a black background)

bind '"\e[A": history-search-backward' # give first few letters to search
bind '"\e[B": history-search-forward'

export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias uniqc="uniq -c | awk '{print \$1\"\t\"\$2}'"
alias qsub="qsub -cwd"
alias align="sed ':x s/\(^\|\t\)\t/\1 \t/; t x' | column -ts$'\t'"
alias n="history | tail -2 | head -1 | tr -s ' ' | cut -d' ' -f3- | awk '{print \"# \"\$0}' >> notes"

umask u=rwx,g=rwx,o=

# wiki items
function wiki (){
        dig +short txt "${1}.wp.dg.cx"
}


# Scripts in a specified directory that can be accessed with "u" command if they have the proper hashbang
YOURPATH=""
function u() {

fun=$1
shift 1

$YOURPATH/$fun "$@"

}
