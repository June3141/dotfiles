# ==== general config ========================================================
export LC_ALL='ja_JP.UTF-8'
export LANG="ja_JP.UTF-8"
export LC_TYPE="ja_JP.UTF-8"

#==== define functions ======================================================
# load config files with path
function load_config() {
        lib=${1:?"You have to specify a library file"}

        # check config file is exist
        if [ -f "$lib" ];then
                . "$lib"
        fi
}

# ==== load configs ===========================================================
# general
load_config ${ZDOTDIR}/config/general.zsh

# setting for tmux
load_config ${ZDOTDIR}/config/tmux.zsh

# setting for lang
load_config ${ZDOTDIR}/config/lang.zsh

# setting for tex
load_config ${ZDOTDIR}/config/tex.zsh

# setting for app
load_config ${ZDOTDIR}/config/app.zsh

# setting for app
load_config ${ZDOTDIR}/config/alias.zsh

# setting for util
load_config ${ZDOTDIR}/config/util.zsh

# setting for util
load_config ${ZDOTDIR}/config/dev.zsh

# setting for theme
load_config ${ZDOTDIR}/theme/theme.zsh


# ==== load completions =======================================================
autoload bashcompinit && bashcompinit

# completions for dev
load_config ${ZDOTDIR}/completions/dev/main.zsh

autoload -U compinit
compinit

# ==== zsh plugin manage =====================================================
# launch zshplugin
load_config ${ZDOTDIR}/plugins/init.zsh

# load zsh plugins
load_config ${ZDOTDIR}/plugins/zinit.zsh
load_config ${ZDOTDIR}/plugins/zinit_lazy.zsh
### End of Zinit's installer chunk

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
