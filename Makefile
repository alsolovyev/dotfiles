all: help

.PHONY: setup
setup: setup-nvim setup-alacritty setup-starship
	@echo "all setup tasks completed"

.PHONY: setup-hooks
setup-hooks:
	@chmod +x .github/hooks/*
	@git config core.hooksPath .github/hooks

.PHONY: setup-nvim
setup-nvim:
	@ln -sfn $(PWD)/nvim ~/.config/nvim
	@echo "nvim configuration linked to ~/.config/nvim"

.PHONY: setup-alacritty
setup-alacritty:
	@ln -sfn $(PWD)/alacritty ~/.config/alacritty
	@echo "alacritty configuration linked to ~/.config/alacritty"

.PHONY: setup-starship
setup-starship:
	@ln -sfn $(PWD)/starship/starship.toml ~/.config/starship.toml
	@echo "starship configuration linked to ~/.config/starship.toml"

.PHONY: help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  help            - Displays this help message."
	@echo "  setup           - Runs all setup tasks"
	@echo "  setup-hooks     - Sets up Git hooks"
	@echo "  setup-nvim      - Sets up nvim configuration"
	@echo "  setup-alacritty - Sets up Alacritty terminal configuration"
	@echo "  setup-starship  - Sets up Starship configuration"
