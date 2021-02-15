# ==== asdf-vm ===============================================================
. $HOME/.asdf/asdf.sh

export FPATH="${ASDF_DIR}/.asdf/completions:${FPATH}"
autoload -Uz compinit && compinit

# nodejs
export GNUPGHOME="${ASDF_DIR}/keyrings/nodejs"

# npm
export PATH="${HOME}/.npm-global/bin:$PATH"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"

# ==== JavaScript ============================================================
# deno
export PATH="${HOME}/.deno/bin:${PATH}"

# ==== python ================================================================
# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# conda
# https://poyo.hatenablog.jp/entry/2019/03/19/133350#Conda
alias activate_conda_env='source $(conda info --root)/etc/profile.d/conda.sh'

# ==== rust ==================================================================
# rustup env
source "$HOME/.cargo/env"

# ==== ruby ===================================================================
# ruby tools
export PATH="${HOME}/.gem/ruby/2.7.0/bin:${PATH}"

# ==== terraform =============================================================
# tfenv (virtual env for terraform)
export PATH="${HOME}/.tfenv/bin:${PATH}"
