all: help

.PHONY: hooks
hooks:
	@chmod +x .github/hooks/*
	@git config core.hooksPath .github/hooks

.PHONY: setup-nvim
setup-nvim:
	@ln -sfn $(PWD)/nvim ~/.config/nvim
	@echo "nvim configuration linked to ~/.config/nvim."

.PHONY: help
help:
	@echo "Usage: make [command]"
	@echo " "
	@echo "Available commands:"
	@echo "  help       - Displays this help message"
	@echo "  hooks      - Sets up Git hooks"
	@echo "  setup-nvim - Creates a symlink for nvim configuration"
