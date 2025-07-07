#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
	case "$(uname -s)" in
	Darwin)
		STOW_FOLDERS="kitty,karabiner,nvim,starship,tmux,vscode,zsh_macos,ssh,scripts,aerospace,ripgrep,yazi"
	;;
  Linux)
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      case "$ID" in
        debian | ubuntu)
          rm -rf "$HOME/.zshrc"
          STOW_FOLDERS="kitty,nvim,starship,tmux,zsh_linux,ssh,scripts,ripgrep,yazi"
          ;;
        arch)
          stow -D ../omarchy -t ~/.local/share 
          stow -t ~/.local/share ../omarchy
          OMARCHY_STOW_FOLDERS="../omarchy/config/btop,../omarchy/config/environment.d,../omarchy/config/fastfetch,../omarchy/config/hypr,../omarchy/config/waybar,../omarchy/config/wofi,../omarchy/config/xournalpp"

          for folder in $(echo $OMARCHY_STOW_FOLDERS | sed "s/,/ /g"); do
            echo "stow omarchy $folder to ~/.config"
            stow -D $folder -t $HOME/.config
            stow $folder -t $HOME/.config
          done

          STOW_FOLDERS="kitty,nvim,starship,tmux,zsh_arch,ssh,scripts,ripgrep,yazi"
          ;;
      esac
    fi       # ← Fix: Close the 'if' before the next ';;'
  ;;
	esac
fi

if [[ -z $DOTFILES ]]; then
	DOTFILES=$HOME/.dotfiles/configs
fi

pushd $DOTFILES

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
	echo "stow $folder"
	stow -D $folder -t $HOME
	stow $folder -t $HOME
done

popd
