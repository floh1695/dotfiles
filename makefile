MKDIR = mkdir -p
SYMLINK = ln -sf
COPY = cp -f

all: install

install: bash vim git X11

ETC_DIR = $(HOME)/.envir/etc

BASH_DIR = $(ETC_DIR)/bash
bash:
	$(MKDIR) $(BASH_DIR)
	$(COPY)    bash_profile.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bash_profile.bash $(HOME)/.bash_profile
	$(COPY)    bash_logout.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bash_logout.bash $(HOME)/.bash_logout
	$(COPY)    bashrc.bash $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/bashrc.bash $(HOME)/.bashrc
	$(COPY) colors.bash $(BASH_DIR)
	$(COPY)	style.bash $(BASH_DIR)

VIM_DIR = $(ETC_DIR)/vim
vim:
	$(MKDIR) $(VIM_DIR)
	$(COPY)    vimrc.vim $(VIM_DIR)
	$(SYMLINK) $(VIM_DIR)/vimrc.vim $(HOME)/.vimrc

GIT_DIR = $(ETC_DIR)/git
git:
	$(MKDIR) $(GIT_DIR)
	$(COPY)    gitconfig.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitconfig.git $(HOME)/.gitconfig
	$(COPY)    gitignore.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitignore.git $(HOME)/.gitignore

X11_DIR = $(ETC_DIR)/X11
X11:
	$(MKDIR) $(X11_DIR)
	$(COPY) Xresources.X11 $(X11_DIR)
	$(SYMLINK) $(X11_DIR)/Xresources.X11 $(HOME)/.Xresources

