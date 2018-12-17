DOTFILES = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
BIN = /usr/bin
CURL = $(BIN)/curl
OS = $(shell uname -s)

all : git vim zsh

clean : clean-git clean-vim clean-zsh

git : ${HOME}/.gitconfig
ssh : ${HOME}/.ssh/config
tmux : ${HOME}/.tmux.conf
vim : ${HOME}/.vimrc ${HOME}/.vim/ftplugin ${HOME}/.vim/bundle/Vundle.vim
zsh : ${HOME}/.zshrc


#----- git -----#
${HOME}/.gitconfig :
	test -L ${HOME}/.gitconfig || ln -sf $(DOTFILES).gitconfig ${HOME}/.gitconfig

clean-git :
	rm -rf ${HOME}/.gitconfig


#----- ssh -----#
${HOME}/.ssh/config : ${HOME}/.ssh/id_rsa.pub
	ln -sf $(DOTFILES).ssh/config ${HOME}/.ssh/config

${HOME}/.ssh/id_rsa.pub : ssh-agent
	@echo "must generate an ssh keypair"
	@echo "see https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/"

${HOME}/.config/systemd/ssh-agent.service : ${HOME}/.config/systemd/user
		test -L ${HOME}/.config/systemd/user/ssh-agent.service || ln -sf $(DOTFILES).config/systemd/user/ssh-agent.service ${HOME}/.config/systemd/user/ssh-agent.service
		systemctl --user enable ssh-agent.service
		systemctl --user start ssh-agent.service

ssh-agent : zsh
ifeq ($(OS),Linux)
	$(MAKE) ${HOME}/.config/systemd/ssh-agent.service
endif
ifeq ($(OS),Darwin)
	@echo "no config for OS X yet"
endif

${HOME}/.config/systemd/user :
	mkdir -p ${HOME}/.config/systemd/user

clean-ssh :
	systemctl --user stop ssh-agent.service
	systemctl --user disable ssh-agent.service
	rm -rf ${HOME}/.config/systemd/user/ssh-agent.service ${HOME}/.ssh/config


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

.PHONY: clean clean-git clean-ssh clean-tmux clean-vim clean-zsh
