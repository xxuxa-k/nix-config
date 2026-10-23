function __cd_ghq_repository
  set -l repo (ghq list --full-path | fzf --reverse)
  if test -n "$repo"
    cd $repo
    commandline --function repaint
  end
end
