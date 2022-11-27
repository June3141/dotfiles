# ==== load dir ===============================================================
# dev
fpath=(${ZDOTDIR}/completions/dev ${fpath})

# ==== AWS ====================================================================
# aws client
complete -C "/usr/local/bin/aws_completer" aws

# ==== k8s ====================================================================
# kubernetes
source <(kubectl completion zsh)

# ==== pipx ===================================================================
eval "$(register-python-argcomplete pipx)"
