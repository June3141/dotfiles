# ==== language ===============================================================
# python
## poetry
export FPATH="./_poertry:${FPATH}"


# ==== AWS ====================================================================
# aws client
complete -C "/usr/local/bin/aws_completer" aws

# eksctl
export FPATH="./_eksctl:${FPATH}"

# ==== k8s ====================================================================
# kubernetes
source <(kubectl completion zsh)
