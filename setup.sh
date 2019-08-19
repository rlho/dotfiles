# zshのインストール
# sudo vim /etc/shells
# /usr/local/bin/zsh
chsh -s /usr/local/bin/zsh

# zpreztoのインストール
read "yn?install zprezto? y/n "
if [ $yn = "y" -o $yn = "Y" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

read "yn?install dotfiles? y/n "
if [ $yn = "y" -o $yn = "Y" ]; then
    DOT_FILES=(.zshrc .gitconfig .gitignore .vimrc .vim .peco.conf)

    echo "installing dotfiles...\n"
    for file in ${DOT_FILES[@]}
    do
        if [ $yn = "y" -o $yn = "Y" ]; then
            rm -rf $HOME/$file
            ln -s `pwd`/$file $HOME/$file
            echo "done!: ~/$file"
        fi
    done
fi

read "yn?install peco? y/n "
if [ $yn = "y" -o $yn = "Y" ]; then
  brew install peco
fi

# cool-pecoのインストール
read "yn?install cool-peco? y/n "
if [ $yn = "y" -o $yn = "Y" ]; then
  CPDIR=~/
  cd $CPDIR
  git clone https://github.com/ryoppy/cool-peco.git
  cd cool-peco
  sh ./install.sh
fi

# tig
read "yn?install tig? y/n "
if [ $yn = "y" -o $yn = "Y" ]; then
  brew install tig
fi
