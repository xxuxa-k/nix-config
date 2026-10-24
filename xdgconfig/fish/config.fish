set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
set -gx NB_DIR "$HOME/ghq/github.com/xxuxa-k/nb"

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
