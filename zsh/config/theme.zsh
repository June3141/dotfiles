# change zsh prompt
PROMPT="%c %{$fg[green]%}> "


function left_prompt() {
  BG="\e[44m"
  DIR="${BG} %c"

  sharpColor="\e[34m"
  sharp="%{$reset_color%}${sharpColor}\uE0B0"

  echo "${DIR}${sharp}\e[m "
}


PROMPT=$'
\e[7m\e[3%(?.2.1)mStatus %?\e[39m%1(j. : Job%2(j.s.) %j.)\e[m
%# '

PROMPT=$(left_prompt)
