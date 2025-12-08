all: help

.PHONY: setup
setup: setup-nvim
	@echo "all setup tasks completed"

.PHONY: setup-hooks
setup-hooks:
	@chmod +x .github/hooks/*
	@git config core.hooksPath .github/hooks

.PHONY: setup-nvim
setup-nvim:
	@ln -sfn $(PWD)/nvim ~/.config/nvim
	@echo "nvim configuration linked to ~/.config/nvim."

.PHONY: help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  help        - Displays this help message."
	@echo "  setup-hooks - Sets up Git hooks"
	@echo "  setup       - Runs all setup tasks"
	@echo "  setup-nvim  - Sets up nvim configuration."
