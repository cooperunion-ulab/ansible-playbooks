# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2023  Jacob Koziej <jacobkoziej@gmail.com>

MDFORMAT ?= mdformat
MDFORMATFLAGS +=  \
	--wrap 72

PIPCOMPILE ?= pip-compile

YAMLLINT ?= yamllint

YAMLFIX ?= yamlfix


MARKDOWN_FILES += $(shell fd --exclude 'LICENSE\.md' --extension md)
YAML_FILES     += $(shell fd --hidden --extension yaml --extension yml)


.PHONY: all
all:


.PHONY: fmt
fmt:
	@$(MDFORMAT) $(MDFORMATFLAGS) $(MARKDOWN_FILES) || true
	@$(YAMLFIX) $(YAML_FILES) || true


.PHONY: lint
lint:
	@$(YAMLLINT) $(YAML_FILES) || true


.PHONY: dev-requirements.txt
dev-requirements.txt:
	$(PIPCOMPILE) --extra dev --output-file $@


.PHONY: requirements.txt
requirements.txt:
	$(PIPCOMPILE) --output-file $@
