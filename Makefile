PREFIX  = $(HOME)/.local/share/hyprlock
CONFIG  = $(HOME)/.config/hypr

RED_SRC   = hyprlock-netlogin-red
BLUE_SRC  = hyprlock-netlogin-blue

.PHONY: all install-red install-blue uninstall clean

all: install-red

# ── Install red variant ──────────────────────────
install-red:
	mkdir -p $(DESTDIR)$(PREFIX)/$(RED_SRC)/assets
	mkdir -p $(DESTDIR)$(PREFIX)/$(RED_SRC)/backgrounds
	mkdir -p $(DESTDIR)$(PREFIX)/$(RED_SRC)/scripts
	cp -r $(RED_SRC)/assets/*        $(DESTDIR)$(PREFIX)/$(RED_SRC)/assets/
	cp -r $(RED_SRC)/backgrounds/*   $(DESTDIR)$(PREFIX)/$(RED_SRC)/backgrounds/
	cp -r $(RED_SRC)/scripts/*       $(DESTDIR)$(PREFIX)/$(RED_SRC)/scripts/
	chmod +x $(DESTDIR)$(PREFIX)/$(RED_SRC)/scripts/*.sh
	mkdir -p $(CONFIG)
	cp $(RED_SRC)/hyprlock.conf $(CONFIG)/hyprlock.conf
	@echo ""
	@echo "NetLogin Red installed."
	@echo "  Config : $(CONFIG)/hyprlock.conf"
	@echo "  Theme  : $(DESTDIR)$(PREFIX)/$(RED_SRC)/"
	@echo ""
	@echo "Test with: hyprlock"

# ── Install blue variant ─────────────────────────
install-blue:
	mkdir -p $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/assets
	mkdir -p $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/backgrounds
	mkdir -p $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/scripts
	cp -r $(BLUE_SRC)/assets/*        $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/assets/
	cp -r $(BLUE_SRC)/backgrounds/*   $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/backgrounds/
	cp -r $(BLUE_SRC)/scripts/*       $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/scripts/
	chmod +x $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/scripts/*.sh
	mkdir -p $(CONFIG)
	cp $(BLUE_SRC)/hyprlock.conf $(CONFIG)/hyprlock.conf
	@echo ""
	@echo "NetLogin Blue installed."
	@echo "  Config : $(CONFIG)/hyprlock.conf"
	@echo "  Theme  : $(DESTDIR)$(PREFIX)/$(BLUE_SRC)/"
	@echo ""
	@echo "Test with: hyprlock"

# ── Uninstall ────────────────────────────────────
uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/$(RED_SRC)
	rm -rf $(DESTDIR)$(PREFIX)/$(BLUE_SRC)
	rm -f $(CONFIG)/hyprlock.conf
	@echo "Uninstalled."

# ── Clean (local) ────────────────────────────────
clean:
	@echo "Nothing to clean."
