all: help

.PHONY: hooks
hooks:
	chmod +x .github/hooks/*
	git config core.hooksPath .github/hooks

.PHONY: help
help: 
	@echo "Usage: make [command]"                                                                     
	@echo " "
	@echo "Available commands:"
	@echo "  hooks   - Sets up Git hooks"
	@echo "  help    - Displays this help message"
