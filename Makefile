# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2023  Jacob Koziej <jacobkoziej@gmail.com>

MDFORMAT ?= mdformat
MDFORMATFLAGS +=  \
	--wrap 72

PIPCOMPILE ?= pip-compile


.PHONY: all
all:


.PHONY: fmt
fmt:
	@$(MDFORMAT) $(MDFORMATFLAGS) README.md


.PHONY: dev-requirements.txt
dev-requirements.txt:
	$(PIPCOMPILE) --extra dev --output-file $@


.PHONY: requirements.txt
requirements.txt:
	$(PIPCOMPILE) --output-file $@
