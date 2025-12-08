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

.PHONY: clean
clean: clean-nvim clean-alacritty clean-starship clean-tmux
	@echo "all cleanup tasks completed"

.PHONY: clean-alacritty
clean-alacritty:
	@rm -rf ~/.config/alacritty
	@echo "alacritty configuration unlinked"

.PHONY: clean-nvim
clean-nvim:
	@rm -rf ~/.config/nvim
	@echo "nvim configuration unlinked"

.PHONY: clean-starship
clean-starship:
	@rm -f ~/.config/starship.toml
	@echo "starship configuration unlinked"

.PHONY: clean-tmux
clean-tmux:
	@rm -rf ~/.config/tmux
	@echo "tmux configuration unlinked"

.PHONY: update-submodules
update-submodules:
	@git submodule update --init --recursive
	@echo "submodules initialized and updated"

.PHONY: clean-submodules
clean-submodules:
	@git submodule deinit --all -f
	@echo "submodules deinitialized"

.PHONY: help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  clean             - Runs all cleanup tasks"
	@echo "  clean-alacritty   - Cleans up Alacritty terminal configuration"
	@echo "  clean-nvim        - Cleans up nvim configuration"
	@echo "  clean-starship    - Cleans up Starship configuration"
	@echo "  clean-submodules  - Deinitializes all submodules"
	@echo "  clean-tmux        - Cleans up Tmux configuration"
	@echo "  help              - Displays this help message"
	@echo "  setup             - Runs all setup tasks"
	@echo "  setup-alacritty   - Sets up Alacritty terminal configuration"
	@echo "  setup-hooks       - Sets up Git hooks"
	@echo "  setup-nvim        - Sets up nvim configuration"
	@echo "  setup-starship    - Sets up Starship configuration"
	@echo "  setup-tmux        - Sets up Tmux configuration"
	@echo "  update-submodules - Initializes and/or updates submodules"
