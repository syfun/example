# 食用教程

## neovim

[安装neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

`brew install neovim`

## vim-plug

[Github](https://github.com/junegunn/vim-plug)

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## 食用配置

拷贝`init.vim`到`~/.config/nvim/init.vim`

或者

`ln -s $(pwd)/init.vim ~/.config/nvim/init.vim`


## 安装插件

`nvim`命令打开后执行`:PlugInstall`

## defx

`let g:python3_host_prog = '$HOME/.pyenv/shims/python3`

defx-icons乱码问题解决：

1. 安装[nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

2. iterm2设置non-ascii字体

## coc

plugins:
- coc-pyright
- coc-json
-

settings:

```json
{
    "python.formatting.provider": "black",
    "python.formatting.blackPath": "/usr/local/bin/black",
    "python.formatting.blackArgs": [
        "-S",
        "-l 100"
    ],
    "pyright.organizeimports.provider": "isort"
}
```

pyproject.toml

```
[tool.black]
line-length = 100
skip-string-normalization = true

[tool.isort]  # https://pycqa.github.io/isort/docs/configuration/black_compatibility/
profile = "black"
multi_line_output = 3
```
