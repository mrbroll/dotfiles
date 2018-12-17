DOTFILES = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BIN = /usr/bin
CURL = $(BIN)/curl

all : git vim zsh

clean : clean-git clean-vim clean-zsh

git : ${HOME}/.gitconfig
tmux : ${HOME}/.tmux.conf
vim : ${HOME}/.vimrc ${HOME}/.vim/ftplugin ${HOME}/.vim/bundle/Vundle.vim
zsh : ${HOME}/.zshrc


#----- git -----#
${HOME}/.gitconfig :
	test -L ${HOME}/.gitconfig || ln -sf $(DOTFILES).gitconfig ${HOME}/.gitconfig

clean-git :
	rm -rf ${HOME}/.gitconfig


#----- tmux -----#
${HOME}/.tmux.conf :
	ln -sf $(DOTFILES).tmux.conf ${HOME}/.tmux.conf

clean-tmux:
	rm -f ${HOME}/.tmux.conf

#----- vim -----#
${HOME}/.vimrc :
	ln -sf $(DOTFILES).vimrc ${HOME}/.vimrc

${HOME}/.vim :
	mkdir ${HOME}/.vim

${HOME}/.vim/ftplugin : ${HOME}/.vim
	ln -sf $(DOTFILES).vim/ftplugin ${HOME}/.vim/ftplugin

${HOME}/.vim/bundle : ${HOME}/.vim
	mkdir ${HOME}/.vim/bundle

${HOME}/.vim/bundle/Vundle.vim : ${HOME}/.vim/bundle ${HOME}/.vimrc
	test -d ${HOME}/.vim/bundle/Vundle.vim || \
	git clone git@github.com:VundleVim/Vundle.vim ${HOME}/.vim/bundle/Vundle.vim && \
	vim +PluginInstall +qall

clean-vim :
	rm -rf ${HOME}/.vim ${HOME}/.vimrc


#----- zsh -----#
${HOME}/.zshrc : ${HOME}/.oh-my-zsh
	test -L ${HOME}/.zshrc || ln -sf $(DOTFILES).zshrc ${HOME}/.zshrc

${HOME}/.oh-my-zsh : $(CURL)
    $(shell sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")

clean-zsh :
	rm -rf ${HOME}/.oh-my-zsh) ${HOME}/.zshrc


$(CURL) : 
	sudo apt install curl

.PHONY: clean clean-git clean-tmux clean-vim clean-zsh
