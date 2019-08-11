AC_PREREQ([2.60])

AC_INIT([init-scripts], [3], [goliath@infraroot.at], init-scripts)
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([foreign subdir-objects dist-xz])
AM_SILENT_RULES([yes])
AC_PROG_INSTALL
AC_PROG_MKDIR_P
AC_PROG_LN_S

AC_DEFINE_DIR(SVCDIR, sysconfdir/init.d, [Startup service directory])
AC_DEFINE_DIR(GCRONDIR, sysconfdir/crontab.d, [Cron service directory])
AC_DEFINE_DIR(TEMPLATEDIR, datadir/init, [Service template directory])
AC_DEFINE_DIR(SCRIPTDIR, libexecdir/init, [Helper script directory])
AC_DEFINE_DIR(DHCPCDHOOKDIR, libexecdir/dhcpcd-hooks, [DHCPCD hook directory])

AC_DEFINE_DIR(SBINPATH, sbindir, [Fully evaluated sbin directory])
AC_DEFINE_DIR(ETCPATH, sysconfdir, [Fulle evaluated etc directory])
AC_DEFINE_DIR(STATEFILESPATH, prefix/var/lib, [Path for persistent state files])

AC_CONFIG_FILES([services/sigkill])
AC_CONFIG_FILES([services/sigterm])
AC_CONFIG_FILES([services/sysfs])
AC_CONFIG_FILES([services/devfs])
AC_CONFIG_FILES([services/procfs])
AC_CONFIG_FILES([services/ifrename])
AC_CONFIG_FILES([services/ifcfg])
AC_CONFIG_FILES([services/ifdown])
AC_CONFIG_FILES([services/modules])
AC_CONFIG_FILES([services/hostapd])
AC_CONFIG_FILES([services/swclock])
AC_CONFIG_FILES([services/swclocksave])
AC_CONFIG_FILES([services/nft])
AC_CONFIG_FILES([services/sshd])
AC_CONFIG_FILES([services/sshd_keygen])
AC_CONFIG_FILES([services/mountusr])
AC_CONFIG_FILES([services/tmpfsvar])
AC_CONFIG_FILES([services/dhcpcd])
AC_CONFIG_FILES([scripts/ifrename.sh])
AC_CONFIG_FILES([scripts/modules_load.sh])

AC_CONFIG_FILES([crontab/swclock])
AC_CONFIG_FILES([etc/40-ntpsetdate])

AC_ARG_ENABLE([swclock],
	[AS_HELP_STRING([--enable-swclock], [Enable software pseudo RTC])],
	[case "${enableval}" in
	yes) AM_CONDITIONAL([SWCLOCK], [true]) ;;
	no)  AM_CONDITIONAL([SWCLOCK], [false]) ;;
	*) AC_MSG_ERROR([bad value ${enableval} for --enable-swclock]) ;;
	esac],
	[AM_CONDITIONAL([SWCLOCK], [false])])

AC_ARG_ENABLE([dhcpclient],
	[AS_HELP_STRING([--enable-dhcpclient], [Enable DHCP client])],
	[case "${enableval}" in
	yes) AM_CONDITIONAL([DHCPCLIENT], [true]) ;;
	no)  AM_CONDITIONAL([DHCPCLIENT], [false]) ;;
	*) AC_MSG_ERROR([bad value ${enableval} for --enable-dhcpclient]) ;;
	esac],
	[AM_CONDITIONAL([DHCPCLIENT], [false])])

AC_OUTPUT([Makefile])
