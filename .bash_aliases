alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias eb="vim ~/.bash_aliases"
alias rb="source ~/.bash_aliases"
alias check_start="vim /var/log/cloud-init-output.log"
alias c='clear'
alias a='tmux attach'

# Conda Aliases
alias cdl='conda info --envs'
alias cdd='conda deactivate'
alias cda='conda activate $1'
alias cdr='conda env remove -n $1'

mcd(){
  mkdir -p $1 && cd $1
}

largest(){
  du -ah $1 | sort -n -r | head -n 20
}

untar(){
  tar zxvf $1 -C $2
}
