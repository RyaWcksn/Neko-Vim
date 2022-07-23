<h1 align="center">🐱 Neko Vim (Nvim) 🐱</h1>


<img src="./images/Dashboard.png" align="center"></img>

<div align="center">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)](https://lua.org)

</div>

<div align="center">
 <a href="https://github.com/AyaWcksn/Neko-Vim/tree/master#installation"> Installation 💻 </a>
 <span>  </span>
 <a href="https://github.com/AyaWcksn/Neko-Vim/blob/master/docs/KEYMAPS.md"> Keymaps ⌨️ </a>
</div>

Neovim distribution created by Lua programming language  
Why i'm using Neko as name? It's simple because when it combine, the name turns into Nvim haha! (damn weebs)  

*NOW* i've done some refactoring to make it faster from *700ms* to around *150ms*.

## Installation 💻 

- Linux and MacOS 

```shell
bash <(curl -s https://github.com/RyaWcksn/Neko-Vim/install.sh)>
```

## Features 🔥

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

## How to use ❓

It's just basic typical neovim configuration just like other  
Y for copy whole line, y for copy, p for paste, h/j/k/l for movement, etc  
You can refer to this [mapping](./docs/KEYMAPS.md) page for specifics commands mapping keys  

## Screenshoots 📸

- Git

<img src="./images/LazyGit.png" align="center"></img>

I'm using [LazyGit](https://github.com/jesseduffield/lazygit) for my git related stuff  
Cherry-picking, commits, push, pull, etc

- Global file search

<img src="./images/File.png" align="center"></img>

Global file search just like `Ctrl/Cmd + p` in VSCode

- LSP

<img src="./images/Autocompletion.png" align="center"></img>

I'm using [vim-cmp](https://github.com/hrsh7th/nvim-cmp) as completion plugin  
and [Luasnip](https://github.com/L3MON4D3/LuaSnip) as snippet plugin  
also with [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for my snippets management

<img src="./images/Signature.png" align="center"></img>

There's also included [Lsp-signature](https://github.com/ray-x/lsp_signature.nvim) for nice touch in the code!

- LSP Language
 
<img src="./images/lsp-installer.png" align="center"></img>

For the language server, i'm using [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer), you can look at there how to install language server

## Future development 🌍

| Feature                    | Status   |
|----------------------------|----------|
| Debugging                  | [On Progress](https://github.com/RyaWcksn/Neko-Vim/issues/50)|
| Work in termux             | Done      |

