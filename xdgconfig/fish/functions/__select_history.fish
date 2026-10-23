function __select_history
  set -l query (commandline --cut-at-cursor | string collect)
  set -l selected (history | fzf --query "$query" | string collect)
  if test -n "$selected"
    commandline --replace -- "$selected"
    commandline --cursor (string length -- "$selected")
  end
  commandline --function repaint
end
