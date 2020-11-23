# ==== fzf ===================================================================
# fzf のデフォルト設定
export FZF_DEFAULT_OPTS="--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi --ansi"

# fzf で検索した結果を渡し，cd する
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# 上記の vscode ver.
codefd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    code "$dir"
}


# fzf-cdr
function fzf-cdr() {
    target_dir=`cdr -l | sed "s/^[^ ][^ ]*  *//" | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
alias cdd="fzf-cdr"

# ==== direnv ================================================================
# direnv hook for zsh
export EDITOR="nvim"
eval "$(direnv hook zsh)"