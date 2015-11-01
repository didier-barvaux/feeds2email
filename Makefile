#
# Copyright (c) 2015 Didier Barvaux
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

PACKAGE_NAME = feeds2email
HELP2MAN = help2man

DESTDIR =
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

all: $(PACKAGE_NAME).1

$(PACKAGE_NAME).1: $(PACKAGE_NAME)
	$(HELP2MAN) --output=$@ -s 1 --no-info \
		-m "$(PACKAGE_NAME)" -S "$(PACKAGE_NAME)" \
		-n "$(PACKAGE_NAME)" \
		./$(PACKAGE_NAME)

install: $(PACKAGE_NAME) $(PACKAGE_NAME).1
	install -d -m 755 $(DESTDIR)$(BINDIR)
	install -m 755 $(PACKAGE_NAME) $(DESTDIR)$(BINDIR)
	install -d -m 755 $(DESTDIR)$(MANDIR)/man1
	install -m 644 $(PACKAGE_NAME).1 $(DESTDIR)$(MANDIR)/man1

uninstall:
	$(RM) $(DESTDIR)$(BINDIR)/$(PACKAGE_NAME)
	$(RM) $(DESTDIR)$(MANDIR)/man1/$(PACKAGE_NAME).1

