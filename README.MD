### 安装方法
```
# 安装vim
sudo apt-get install vim
sudo apt-get install vim-gnom
```
```
# 安装插件
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
```
# 安装vim配置文件
git clone https://github.com/zhcshine/vimrc/
cp vimrc/vimrc/.vimrc-xxx-xxx ~/.vimrc
vim ~/.vimrc
> :BundleInstall
```

### 错误提示
```
Error detected while processing function <SNR>22_IndentGuidesToggle..indent_guides#toggle..indent_guides#enable..indent_guides
#init_script_vars..indent_guides#capture_highlight:
line    2:
E411: highlight group not found: Normal
Press ENTER or type command to continue
```
在配置文件中添加
```
colorscheme default
```
