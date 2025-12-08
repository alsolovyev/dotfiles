.PHONY: hooks
hooks:
	chmod +x .github/hooks/*
	git config core.hooksPath .github/hooks

