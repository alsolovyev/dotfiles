all: help

.PHONY: setup
setup: setup-nvim setup-alacritty setup-starship setup-tmux
	@echo "all setup tasks completed"

.PHONY: setup-hooks
setup-hooks:
	@chmod +x .github/hooks/*
	@git config core.hooksPath .github/hooks

.PHONY: setup-alacritty
setup-alacritty:
	@ln -sfn $(PWD)/alacritty ~/.config/alacritty
	@echo "alacritty configuration linked to ~/.config/alacritty"

.PHONY: setup-nvim
setup-nvim:
	@git submodule update --init --recursive nvim
	@ln -sfn $(PWD)/nvim ~/.config/nvim
	@echo "nvim configuration linked to ~/.config/nvim"

.PHONY: setup-starship
setup-starship:
	@ln -sfn $(PWD)/starship/starship.toml ~/.config/starship.toml
	@echo "starship configuration linked to ~/.config/starship.toml"

.PHONY: setup-tmux
setup-tmux:
	@git submodule update --init --recursive tmux/plugins/catppuccin
	@ln -sfn $(PWD)/tmux ~/.config/tmux
	@echo "tmux configuration linked to ~/.config/tmux"

.PHONY: help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  help            - Displays this help message"
	@echo "  setup           - Runs all setup tasks"
	@echo "  setup-alacritty - Sets up Alacritty terminal configuration"
	@echo "  setup-hooks     - Sets up Git hooks"
	@echo "  setup-nvim      - Sets up nvim configuration"
	@echo "  setup-starship  - Sets up Starship configuration"
	@echo "  setup-tmux      - Sets up Tmux configuration"
