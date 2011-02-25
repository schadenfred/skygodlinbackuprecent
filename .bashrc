# Enable git status at the prompt:

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u:\[\033[31;40m\]\w\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '

# end enable git status at the prompt

