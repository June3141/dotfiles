# ==== asdf-vm ===============================================================
. $HOME/.asdf/asdf.sh

export FPATH="${ASDF_DIR}/.asdf/completions:${FPATH}"
autoload -Uz compinit && compinit

# nodejs
export GNUPGHOME="${ASDF_DIR}/keyrings/nodejs"

# npm
export PATH="${HOME}/.npm-global/bin:$PATH"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"

# ==== python ================================================================
# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# ==== rust ==================================================================
# rustup env
source "$HOME/.cargo/env"

# ==== ruby ===================================================================
# ruby tools
export PATH="${HOME}/.gem/ruby/2.7.0/bin:${PATH}"

# ==== terraform =============================================================
# tfenv (virtual env for terraform)
export PATH="${HOME}/.tfenv/bin:${PATH}"

