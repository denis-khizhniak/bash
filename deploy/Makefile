# Usage:
# make			# deploy everything on the system
# make etc		# deploy etc configurations
# make dotfiles		# deploy dotfiles
# make packages		# install all packages	


.PHONY: all etc dotfiles packages

# semicolon separated list of exceptions
EXCEPTIONS = "alsa"

# projects path
ETC_PROJECT = ${HOME}/Projects/etc
DOTFILES_PROJECT = ${HOME}/etc 

# file with list of packages to install
# PACKAGES_TO_INSTALL = ${HOME}/Projects/bash/deploy/packages_to_install.txt

all: etc dotfiles packages

etc:
	@echo "Deploying etc configuration..."
	cd /etc; \
	symlnk_to_dir ${ETC_PROJECT}

dotfiles:
	@echo "Deploying dotfiles..."
	cd ${HOME}; \
	symlnk_to_dir ${DOTFILES_PROJECT} ${EXCEPTIONS}

packages:
	@echo "Installing packages..."
