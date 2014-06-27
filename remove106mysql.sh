#!/bin/sh

####################################################################################################
#
# Copyright (c) 2013, JAMF Software, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
####################################################################################################
#
# SUPPORT FOR THIS PROGRAM
#
#       This program is distributed "as is" by JAMF Software, LLC's Resource Kit team. For more
#       information or support for the Resource Kit, please utilize the following resources:
#
#               http://list.jamfsoftware.com/mailman/listinfo/resourcekit
#
#               http://www.jamfsoftware.com/support/resource-kit
#
#       Please reference our SLA for information regarding support of this application:
#
#               http://www.jamfsoftware.com/support/resource-kit-sla
#
####################################################################################################
#
# ABOUT THIS PROGRAM
#
# NAME
#  remove106mysql.sh -- Permanently remove built-in mysql from OSX Server Environments
#
# SYNOPSIS
#	sudo remove10.6mysql.sh
#
#
# DESCRIPTION
#	This script will remove all traces of the OSX Server 5.1 MySQL from the targeted system. 
# After run, the user can then install newer version of MySQL without issue.
#
####################################################################################################

#Stop Server Service
serveradmin stop mysql

#Unload Daemon
launchctl unload /System/Library/LaunchDaemons/org.mysql.mysqld.plist

#Remove Daemon
rm -f /System/Library/LaunchDaemons/org.mysql.mysqld.plist

# Remove configuration file
rm -f /etc/my.cnf

# Remove Binaries
rm -f /usr/bin/msql2mysql
rm -f /usr/bin/mysql
rm -f /usr/bin/mysql_client_test
rm -f /usr/bin/mysql_config
rm -f /usr/bin/mysql_convert_table_format
rm -f /usr/bin/mysql_explain_log
rm -f /usr/bin/mysql_find_rows
rm -f /usr/bin/mysql_fix_extensions
rm -f /usr/bin/mysql_fix_privilege_tables
rm -f /usr/bin/mysql_install_db
rm -f /usr/bin/mysql_secure_installation
rm -f /usr/bin/mysql_setpermission
rm -f /usr/bin/mysql_tableinfo
rm -f /usr/bin/mysql_tzinfo_to_sql
rm -f /usr/bin/mysql_upgrade
rm -f /usr/bin/mysql_upgrade_shell
rm -f /usr/bin/mysql_waitpid
rm -f /usr/bin/mysql_zap
rm -f /usr/bin/mysqlaccess
rm -f /usr/bin/mysqladmin
rm -f /usr/bin/mysqlbinlog
rm -f /usr/bin/mysqlbug
rm -f /usr/bin/mysqlcheck
rm -f /usr/bin/mysqld_multi
rm -f /usr/bin/mysqld_safe
rm -f /usr/bin/mysqldump
rm -f /usr/bin/mysqldumpslow
rm -f /usr/bin/mysqlhotcopy
rm -f /usr/bin/mysqlimport
rm -f /usr/bin/mysqlshow
rm -f /usr/bin/mysqltest
rm -f /usr/bin/mysqltestmanager
rm -f /usr/bin/mysqltestmanager-pwgen
rm -f /usr/bin/mysqltestmanagerc

# Remove Apple-Based binary utilities
rm -f /usr/libexec/applemysqlcheckcnf
rm -f /usr/libexec/mysqld
rm -f /usr/libexec/mysqlmanager

#Remove Manual Files
rm -f /usr/share/man/man1/msql2mysql.1
rm -f /usr/share/man/man1/mysql-stress-test.pl.1
rm -f /usr/share/man/man1/mysql-test-run.pl.1
rm -f /usr/share/man/man1/mysql.1
rm -f /usr/share/man/man1/mysql.server.1
rm -f /usr/share/man/man1/mysql_client_test.1
rm -f /usr/share/man/man1/mysql_config.1
rm -f /usr/share/man/man1/mysql_convert_table_format.1
rm -f /usr/share/man/man1/mysql_explain_log.1
rm -f /usr/share/man/man1/mysql_find_rows.1
rm -f /usr/share/man/man1/mysql_fix_extensions.1
rm -f /usr/share/man/man1/mysql_fix_privilege_tables.1
rm -f /usr/share/man/man1/mysql_install_db.1
rm -f /usr/share/man/man1/mysql_secure_installation.1
rm -f /usr/share/man/man1/mysql_setpermission.1
rm -f /usr/share/man/man1/mysql_tableinfo.1
rm -f /usr/share/man/man1/mysql_tzinfo_to_sql.1
rm -f /usr/share/man/man1/mysql_upgrade.1
rm -f /usr/share/man/man1/mysql_upgrade_shell.1
rm -f /usr/share/man/man1/mysql_waitpid.1
rm -f /usr/share/man/man1/mysql_zap.1
rm -f /usr/share/man/man1/mysqlaccess.1
rm -f /usr/share/man/man1/mysqladmin.1
rm -f /usr/share/man/man1/mysqlbinlog.1
rm -f /usr/share/man/man1/mysqlbug.1
rm -f /usr/share/man/man1/mysqlcheck.1
rm -f /usr/share/man/man1/mysqld_multi.1
rm -f /usr/share/man/man1/mysqld_safe.1
rm -f /usr/share/man/man1/mysqldump.1
rm -f /usr/share/man/man1/mysqldumpslow.1
rm -f /usr/share/man/man1/mysqlhotcopy.1
rm -f /usr/share/man/man1/mysqlimport.1
rm -f /usr/share/man/man1/mysqlman.1
rm -f /usr/share/man/man1/mysqlshow.1
rm -f /usr/share/man/man1/mysqltest.1
rm -f /usr/share/man/man1/mysqltestmanager-pwgen.1
rm -f /usr/share/man/man1/mysqltestmanager.1
rm -f /usr/share/man/man1/mysqltestmanagerc.1
rm -f /usr/share/man/man1/safe_mysqld.1
rm -f /usr/share/man/man5/mysql_table.5.gz
rm -f /usr/share/man/man8/applemysqlcheckcnf.8
rm -f /usr/share/man/man8/mysqld.8
rm -f /usr/share/man/man8/mysqlmanager.8

# Remove Logs and bin-logs
rm -rf /usr/share/mysql

# Remove Data Directory
rm -rf /var/mysql
