# syntax highlight
zinit ice wait"!0" atload"_zsh_highlight"
zinit light "zdharma/fast-syntax-highlighting"

# suggest command
zinit ice wait"!1" atload"_zsh_autosuggest_start"
zinit light "zsh-users/zsh-autosuggestions"


# ==== configure =============================================================
autoload -U promptinit; promptinit
