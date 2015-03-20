MKDIR = mkdir -p
SYMLINK = ln -sf
COPY = cp -f

all: install

install: bash vim git

ETC_DIR = $(HOME)/envir/etc

BASH_DIR = $(ETC_DIR)/bash
bash:
	$(MKDIR) $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR) $(HOME)/.etcbash
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
	$(SYMLINK) $(VIM_DIR) $(HOME)/.etcvim	
	$(COPY)    vimrc.vim $(VIM_DIR)
	$(SYMLINK) $(VIM_DIR)/vimrc.vim $(HOME)/.vimrc

GIT_DIR = $(ETC_DIR)/git
git:
	$(MKDIR) $(GIT_DIR)
	$(SYMLINK) $(GIT_DIR) $(HOME)/.etcgit
	$(COPY)    gitconfig.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitconfig.git $(HOME)/.gitconfig
	$(COPY)    gitignore.git $(BASH_DIR)
	$(SYMLINK) $(BASH_DIR)/gitignore.git $(HOME)/.gitignore

