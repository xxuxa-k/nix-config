# nix-config

- flakeを有効にしてnixをインストール
    - https://github.com/NixOS/nix-installer
- homebrewをインストール
    - https://brew.sh/ja/
- flake.nixのusernameを$(whoami)に変更
- task default
- fishに変更
    - chsh -s $(cat /etc/shell | rg fish)
