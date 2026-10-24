function ll
  eza -ahl --git $argv
end

if status is-interactive
  abbr nv nvim
  abbr nvi nvim

  bind \cg __cd_ghq_repository
  bind \cr __select_history

  mise activate fish | source
  zoxide init fish | source
  starship init fish | source
  eval (direnv hook fish)
end
