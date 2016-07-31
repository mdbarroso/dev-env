#!/bin/bash


if which vim >/dev/null; then
	echo "Skipping vim installation ..."
	return 0
else
	echo "About to install vim ..."
fi

apt-get install -y vim exuberant-ctags

INSTALL_PATH=/home/vagrant

mkdir -p $INSTALL_PATH/.vim/autoload $INSTALL_PATH/.vim/bundle && \
curl -LSso $INSTALL_PATH/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cat > $INSTALL_PATH/.vimrc << EOL
execute pathogen#infect()
syntax on
filetype plugin indent on

map <F3> :set numbers<CR>

EOL

cd $INSTALL_PATH/.vim/bundle

# install NERDTree
git clone https://github.com/scrooloose/nerdtree.git

# config NERDTree
cat >> $INSTALL_PATH/.vimrc << EOL

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <F5> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

EOL

# install tagbar 
git clone https://github.com/majutsushi/tagbar

cat >> $INSTALL_PATH/.vimrc << EOL

nmap <F6> :TagbarToggle<CR>

EOL

# install jedi 
git clone https://github.com/davidhalter/jedi-vim.git

# install clojure development plugins

git clone https://github.com/guns/vim-clojure-static 

git clone https://github.com/tpope/vim-fireplace

git clone https://github.com/kien/ctrlp.vim

# remove the binary files from the lookup tree 
cat >> $INSTALL_PATH/.vimrc << EOL

set wildignore+=*/target/*

EOL

# install rainbow parentheses
git clone https://github.com/kien/rainbow_parentheses.vim

cat >> $INSTALL_PATH/.vimrc << EOL

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

EOL

