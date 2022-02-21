#!/bin/bash

echo "Which dotfiles do you wanna install?"
echo "Available: 0: i3, 1: i3status, 2: picom, 3: neofetch, 4: nvim/vim, 5: all (installs all dotfiles)"
echo -n "> "
read CHOICE
readarray -d " " -t CHOICES <<< $CHOICE

for i in ${CHOICES[@]}
do
    case $i in
        "nvim" | "neovim" | "vim" | "nvim/vim" | "4")
            echo "-> cp vimrc ~/.vimrc"
            cp vimrc ~/.vimrc
            echo "-> cp -r nvim/ ~/.config/"
            cp -r nvim/ ~/.config/
        ;;

        "i3" | "0")
            echo "-> cp -r i3/ ~/.config/"
            cp -r i3/ ~/.config/
        ;;

        "i3 status" | "1")
            echo "-> cp -r i3status/ ~/.config/"
            cp -r i3status/ ~/.config/
        ;;

        "picom" | "2")
            echo "-> cp -r picom/ ~/.config/"
            cp -r picom/ ~/.config/
        ;;

        "neofetch" | "3")
            echo "-> cp -r neofetch/ ~/.config/"
            cp -r neofetch/ ~/.config/
        ;;

        "all" | "5")
            echo "-> cp -r */ ~/.config/"
            cp -r */ ~/.config/
	    echo "-> cp vimrc ~/.vimrc"
	    cp vimrc ~/.vimrc
        ;;

        *)
            echo "Invalid choice!"
            exit 1
        ;;
    esac
done

