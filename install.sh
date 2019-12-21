#!/bin/bash
#author : litten
#description : 


# 下载插件管理软件vim-plug
function download_vim_plug()
{
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


# 安装vim插件
function install_vim_plugin()
{
    vim -c "PlugInstall" -c "q" -c "q"
}


function install_python_package()
{
	pip install jedi  # 为了支持vim python jedi补全插件
	pip install autopep8
	pip install isort  # 为了支持vim isort插件
}


apt install git
apt install ctags


# download_vim_plug
# install_vim_plugin

install_python_package




# vim +PlugInstall +qall
vim +PlugInstall +q



