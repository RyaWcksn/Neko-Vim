<h1 align="center">🐱 Neko Vim (Nvim) 🐱</h1>


<img src="./images/Dashboard.png" align="center"></img>


## Installation

- Linux and MacOS 
  
``` shell
cd .config && mv nvim nvim.bak && git clone https://github.com/AyaWcksn/neovim-configuration.git nvim
```

``` shell
nvim +PackerSync
```

- Windows
   
``` cmd
cd %userprofile%\AppData\Local\nvim
del /s /q *
for /f "delims=" %x in ('dir /b /ad .') do rd /s /q "%x"
```

``` cmd
cd %userprofile%\AppData\Local
git clone https://github.com/AyaWcksn/neovim-configuration nvim
```

## Features

- Depedencies :
  - NodeJs 
  - Pip
  - Python

- Features :
  - Lsp for Golang, Python, Javascript, Typescript, Php, Bash, Html, Css, C, C++
  - Live grep
  - Git integration 
  - Org mode and Vim wiki for note taking
  - Images using Telescope
  - Termux integration

- Work in progress
 
| Feature                    | Status   |
|----------------------------|----------|
| Debugging                  | Progress |
| Work in termux and windows | Done     |

## How to use 

It's just basic typical neovim configuration just like other 
Y for copy whole line, y for copy, p for paste, h/j/k/l for movement, etc
You can refer to this [mapping](./docs/KEYMAPS.md) page for specifics commands mapping keys

## Screenshoots

-- Soon --


