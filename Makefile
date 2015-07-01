DOTFILES_GITHUB   := "https://github.com/kegamin/dotfiles.git"
DOTFILES_EXCLUDES := .DS_Store .git .gitmodules
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: install

help:
	@echo "make list           #=> List the files"
	@echo "make update         #=> Fetch changes"
	@echo "make deploy         #=> Create symlink"
	@echo "make init           #=> Setup environment"
	@echo "make install        #=> Updating, deploying and initializng"
	@echo "make clean          #=> Remove the dotfiles"
	@echo "make brew           #=> Update brew packages"
	@echo "make cask           #=> Update cask packages"

list:
	@$(foreach val, $(DOTFILES_FILES), ls -dF $(val);)

# NeoBundle,brew等の各種管理ツールのupdateを入れる
update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master
	brew file update

deploy:
	@echo 'Start deploy dotfiles current directory.'
	@echo 'If this is "dotdir", curretly it is ignored and copy your hand.'
	@echo ''
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
ifeq ($(shell uname), Darwin)
	@$(foreach val, $(wildcard ./etc/init/osx/*.sh), bash $(val);)

homebrew:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_homebrew.sh

brew: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Brewfile

cask: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Caskfile
endif

install: update deploy init
	@exec $$SHELL

clean:
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES_FILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTFILES_DIR)
