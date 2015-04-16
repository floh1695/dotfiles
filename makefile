#!/bin/make -f
MKDIR = mkdir -p
SYMLINK = ln -sf
COPY = cp -f

all: install

install: bash vim git X11

ETC_DIR = $(HOME)/.envir/etc

##### ##### ##### ##### #####
# Start of Bash related rules
##### ##### ##### ##### #####
BASH_DIR = $(ETC_DIR)/bash
bash: bash_profile bash_logout bashrc

bashetc:
	$(MKDIR) $(BASH_DIR)

bash_profile: bashetc
	$(COPY)    bash_profile.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bash_profile.bash $(HOME)/.bash_profile

bash_logout: bashetc
	$(COPY)    bash_logout.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bash_logout.bash $(HOME)/.bash_logout

bashrc: bashetc
	$(COPY)    bashrc.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bashrc.bash $(HOME)/.bashrc
	$(COPY) colors.bash $(BASH_DIR)
	$(COPY)	style.bash $(BASH_DIR)

##### ##### ##### ##### #####
# Start of Vim related rules
##### ##### ##### ##### #####
VIM_DIR = $(ETC_DIR)/vim
vim: vimrc

vimetc:
	$(MKDIR) $(VIM_DIR)

vimrc: vimetc
	$(COPY)    vimrc.vim $(VIM_DIR)
	$(SYMLINK) $(VIM_DIR)/vimrc.vim $(HOME)/.vimrc

##### ##### ##### ##### #####
# Start of Git related rules
##### ##### ##### ##### #####
GIT_DIR = $(ETC_DIR)/git
git: gitconfig gitignore

gitetc:
	$(MKDIR) $(GIT_DIR)

gitconfig: gitetc
	$(COPY)    gitconfig.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitconfig.git $(HOME)/.gitconfig

gitignore: gitetc
	$(COPY)    gitignore.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitignore.git $(HOME)/.gitignore

##### ##### ##### ##### #####
# Start of X11 related rules
##### ##### ##### ##### #####
X11_DIR = $(ETC_DIR)/X11
X11: Xresources xinitrc xprofile

X11etc:
	$(MKDIR) $(X11_DIR)

Xresources: X11etc
	$(COPY) Xresources.config $(X11_DIR)
	$(SYMLINK) $(X11_DIR)/Xresources.config $(HOME)/.Xresources

xshared: X11etc
	$(COPY) xshared.bash $(X11_DIR)

xinitrc: X11etc xshared
	$(COPY) xinitrc.bash $(X11_DIR)
	$(SYMLINK) $(X11_DIR)/xinitrc.bash $(HOME)/.xinitrc

xprofile: X11etc xshared
	$(COPY) xprofile.bash $(X11_DIR)
	$(SYMLINK) $(X11_DIR)/xprofile.bash $(HOME)/.xprofile

