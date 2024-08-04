# Makefile for makejail

DESTDIR=/
prefix = $(DESTDIR)/usr
BIN_DIR = $(prefix)/sbin
DOC_DIR = $(prefix)/share/doc/makejail
MAN_DIR = $(prefix)/share/man/man8
HTML_DIR = $(DOC_DIR)/html
MAN_PAGE_SGML = manpage.sgml
MAN_PAGE = makejail.8
EXAMPLES_DIR = $(DOC_DIR)/examples

INSTALL = install

DISTDIR = makejail

.PHONY: install distclean

all: docs
	@echo "Usage: make [install|uninstall|docs|clean_docs]"

docs:
	python3 makedocs
	docbook-to-man $(MAN_PAGE_SGML) > $(MAN_PAGE)

install:
	if (test ! -d $(BIN_DIR)); then mkdir -p $(BIN_DIR) ; fi
	$(INSTALL) makejail $(BIN_DIR)
	chmod 700 $(BIN_DIR)/makejail
	if (test ! -d $(DOC_DIR)); then mkdir -p $(DOC_DIR) ; chmod 755 $(DOC_DIR) ; fi
	cp doc/README $(DOC_DIR)
	chmod 644 $(DOC_DIR)/README
	if (test ! -d $(HTML_DIR)); then mkdir -p $(HTML_DIR) ; chmod 755 $(HTML_DIR) ; fi
	cp doc/index.html $(HTML_DIR)
	chmod 644 $(HTML_DIR)/index.html
	if (test ! -d $(EXAMPLES_DIR)); then mkdir -p $(EXAMPLES_DIR) ; chmod 755 $(EXAMPLES_DIR) ; fi
	cp -a examples/* $(EXAMPLES_DIR)
	chmod 644 $(EXAMPLES_DIR)/*
	if (test ! -d $(MAN_DIR)); then mkdir -p $(MAN_DIR) ; chmod 755 $(MAN_DIR) ; fi
	$(INSTALL) $(MAN_PAGE) $(MAN_DIR)
	chmod 644 $(MAN_DIR)/$(MAN_PAGE)

clean_docs:
	rm -rf doc $(MAN_PAGE_SGML) $(MAN_PAGE)

uninstall:
	rm -f $(BIN_DIR)/makejail
	rm -rf $(EXAMPLES_DIR)
	rm -rf $(DOC_DIR)
	rm -f $(MAN_DIR)/$(MAN_PAGE)
