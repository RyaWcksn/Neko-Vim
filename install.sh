#!/bin/bash

function print_logo()
{
    cat <<'EOF'
        ⣿⡿⢿⡿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿
        ⣿⡇⠀⢀⣀⠀⠀⠀⠈⠉⠛⠛⣽⣯⣭⣭⣽⣭⣟⣿⠛⠉⠁⠀⠀⠀⠀⠀⢸⣿
        ⣿⣇⠀⠨⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿
        ⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿
        ⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿
        ⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿
        ⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⢠⢀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿
        ⡇⢠⠀⠀⢠⠀⠀⠀⢠⠠⠄⠀⢃⠀⠀⠀⠀⠀⡆⠀⢤⠀⢀⠀⠀⠀⠀⣿⣿⣿
        ⡇⡰⠀⠀⢨⠀⠀⠀⠀⠐⠀⠀⠈⠀⠀⠀⠀⠠⠀⠀⠀⠂⠆⠀⠀⠀⠀⣿⣿⣿
        ⣇⠿⠀⠀⢸⠀⠀⠀⠈⢹⣿⠋⠙⠀⠀⠀⠀⠀⣿⡿⠛⠛⠃⠀⠀⠀⠀⣿⣿⣿
        ⣿⣴⡆⠀⠀⠀⠀⠀⠀⢸⢿⡿⡇⠀⠀⠀⠀⠀⠻⣿⡶⠇⠀⠀⢀⠀⠀⣿⣿⣿
        ⣿⣿⣿⣆⠀⠀⠀⠀⠀⠃⠔⠁⠀⠀⠀⠀⠀⠈⠢⠈⠀⠀⠀⡄⠀⢠ ⣿⣿⣿
        ⣿⣿⣿⣧⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢠⡇⠀⢸⣿⣿⣿
        ⣿⣿⣿⡿⠀⠀⣵⠀⠀⠸⣶⣤⣀⠀⠀⠀⠀⢀⣠⣴⡞⠀⠀⣾⡇⠀⢸⣿⣿⣿
        ⣿⣿⣿⣷⠂⠀⣿⡇⠀⠀⢿⣿⠏⠀⠀⠀⠀⠀⢿⣿⠁⠀⢠⣿⣷⠀⠸⣿⣿⣿
        ⣿⣿⣿⡿⡆⢀⣿⣷⠀⠀⠘⣿⣄⠀⠈⠀⢀⠀⣸⠇⠀⠀⣼⣿⣿⠀⠀⣿⣿⣿
        ⣿⣿⣿⡇⠀⣸⣿⣿⡆⠀⠀⣿⡿⠋⠀⠀⠀⠙⣿⠁⠀⢰⣿⣿⣿⡆⠀⢻⣿⣿
EOF
}

function main()
{
    print_logo

    echo "Cloning Neko-Vim..."
    cd .config  
    FILE=$HOME/.config/nvim
    if [ -d ! "$FILE" ]; then
        echo "Backing up old configuration..."
        mv nvim nvim.bak  
    fi

    git clone https://github.com/RyaWcksn/Neko-Vim.git nvim

    echo "Cloning package manager..."
    git clone --depth 0 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    nvim +PackerSync 

    echo "Thank you $USER for using Neko-Vim as your text editor/IDE"
    echo ""
    echo "Development still continue, if found some issue please report to"
    echo "https://github.com/RyaWcksn/Neko-Vim/issues"
}

main
