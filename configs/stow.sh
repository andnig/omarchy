#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
	case "$(uname -s)" in
	Darwin)
		STOW_FOLDERS="kitty,karabiner,nvim,starship,tmux,vscode,zsh_macos,ssh,scripts,aerospace,ripgrep,yazi,lazygit"
	;;
  Linux)
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      case "$ID" in
        debian | ubuntu)
          rm -rf "$HOME/.zshrc"
          STOW_FOLDERS="kitty,nvim,starship,tmux,zsh_linux,ssh,scripts,ripgrep,yazi,lazygit"
          ;;
        arch)
          stow -D --dir=../ omarchy -t ~/.local/share 
          stow -t ~/.local/share --dir=../ omarchy

          echo "stow omarchy config folder to ~/.config"
          stow -D config -t $HOME/.config --dir=../omarchy/omarchy
          stow config -t $HOME/.config --dir=../omarchy/omarchy

          STOW_FOLDERS="kitty,nvim,starship,tmux,zsh_arch,ssh,scripts,ripgrep,yazi,lazygit"
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
