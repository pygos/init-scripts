ACLOCAL_AMFLAGS = -I m4

sysconf_DATA = etc/initd.env
nobase_sysconf_DATA = netcfg/ifrename
EXTRA_DIST = docs netcfg etc LICENSE README.md

helperdir = @SCRIPTDIR@
helper_PROGRAMS =
helper_SCRIPTS =

include scripts/Makemodule.am
include services/Makemodule.am
include crontab/Makemodule.am

install-data-local:
	$(MKDIR_P) $(DESTDIR)$(SVCDIR)
	$(LN_S) $(TEMPLATEDIR)/loopback $(DESTDIR)$(SVCDIR)/loopback
	$(LN_S) $(TEMPLATEDIR)/hostname $(DESTDIR)$(SVCDIR)/hostname
	$(LN_S) $(TEMPLATEDIR)/sysctl $(DESTDIR)$(SVCDIR)/sysctl
	$(LN_S) $(TEMPLATEDIR)/sysinit $(DESTDIR)$(SVCDIR)/sysinit
	$(LN_S) $(TEMPLATEDIR)/procfs $(DESTDIR)$(SVCDIR)/procfs
	$(LN_S) $(TEMPLATEDIR)/sysfs $(DESTDIR)$(SVCDIR)/sysfs
	$(LN_S) $(TEMPLATEDIR)/devfs $(DESTDIR)$(SVCDIR)/devfs
	$(LN_S) $(TEMPLATEDIR)/tmpfs $(DESTDIR)$(SVCDIR)/tmpfs
	$(LN_S) $(TEMPLATEDIR)/vfs $(DESTDIR)$(SVCDIR)/vfs
	$(LN_S) $(TEMPLATEDIR)/ifdown $(DESTDIR)$(SVCDIR)/ifdown@shutdown
	$(LN_S) $(TEMPLATEDIR)/sync $(DESTDIR)$(SVCDIR)/sync@shutdown
	$(LN_S) $(TEMPLATEDIR)/sigkill $(DESTDIR)$(SVCDIR)/sigkill@shutdown
	$(LN_S) $(TEMPLATEDIR)/sigterm $(DESTDIR)$(SVCDIR)/sigterm@shutdown
	$(LN_S) $(TEMPLATEDIR)/sync $(DESTDIR)$(SVCDIR)/sync@reboot
	$(LN_S) $(TEMPLATEDIR)/sigkill $(DESTDIR)$(SVCDIR)/sigkill@reboot
	$(LN_S) $(TEMPLATEDIR)/sigterm $(DESTDIR)$(SVCDIR)/sigterm@reboot
	$(LN_S) $(TEMPLATEDIR)/ifdown $(DESTDIR)$(SVCDIR)/ifdown@reboot
	$(LN_S) $(TEMPLATEDIR)/ifcfg $(DESTDIR)$(SVCDIR)/ifcfg
	$(LN_S) $(TEMPLATEDIR)/modules $(DESTDIR)$(SVCDIR)/modules
	$(LN_S) $(TEMPLATEDIR)/network $(DESTDIR)$(SVCDIR)/network
	$(LN_S) $(TEMPLATEDIR)/usyslogd $(DESTDIR)$(SVCDIR)/usyslogd
	$(LN_S) $(TEMPLATEDIR)/klogd $(DESTDIR)$(SVCDIR)/klogd
	$(LN_S) $(TEMPLATEDIR)/mountusr $(DESTDIR)$(SVCDIR)/mountusr
	$(LN_S) $(TEMPLATEDIR)/tmpfsrun $(DESTDIR)$(SVCDIR)/tmpfsrun
	$(LN_S) $(TEMPLATEDIR)/tmpfsvar $(DESTDIR)$(SVCDIR)/tmpfsvar
	$(LN_S) $(TEMPLATEDIR)/gcrond $(DESTDIR)$(SVCDIR)/gcrond
