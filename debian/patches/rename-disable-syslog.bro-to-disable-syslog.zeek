Description: <short summary of the patch>
 TODO: Put a short summary on the line above and replace this paragraph
 with a longer explanation of this change. Complete the meta-information
 with other relevant fields (see below for details). To make it easier, the
 information below has been extracted from the changelog. Adjust it or drop
 it.
 .
 securityonion-setup (20120912-0ubuntu0securityonion323) xenial; urgency=medium
 .
   * rename disable-syslog.bro to disable-syslog.zeek
Author: Doug Burks <doug.burks@gmail.com>

---
The information above should follow the Patch Tagging Guidelines, please
checkout http://dep.debian.net/deps/dep3/ to learn about the format. Here
are templates for supplementary fields that you might want to add:

Origin: <vendor|upstream|other>, <url of original patch>
Bug: <url in upstream bugtracker>
Bug-Debian: https://bugs.debian.org/<bugnumber>
Bug-Ubuntu: https://launchpad.net/bugs/<bugnumber>
Forwarded: <no|not-needed|url proving that it has been forwarded>
Reviewed-By: <name and email of someone who approved the patch>
Last-Update: <YYYY-MM-DD>

--- securityonion-setup-20120912.orig/bin/sosetup
+++ securityonion-setup-20120912/bin/sosetup
@@ -1521,18 +1521,18 @@ EOF
 		sed -i 's|^@load file-extraction|#@load file-extraction|g' /opt/bro/share/bro/site/local.bro
 	fi
 
-	# Create /opt/bro/share/bro/disable-syslog/disable-syslog.bro
+	# Create /opt/bro/share/bro/disable-syslog/disable-syslog.zeek
  	mkdir -p /opt/bro/share/bro/disable-syslog/
- 	cat << EOF > /opt/bro/share/bro/disable-syslog/disable-syslog.bro
+ 	cat << EOF > /opt/bro/share/bro/disable-syslog/disable-syslog.zeek
 event zeek_init()
 	{
 	Log::disable_stream(Syslog::LOG);
  	}
 EOF
  
- 	# Create /opt/bro/share/bro/disable-syslog/__load__.bro
- 	cat << EOF > /opt/bro/share/bro/disable-syslog/__load__.bro
-@load ./disable-syslog.bro
+ 	# Create /opt/bro/share/bro/disable-syslog/__load__.zeek
+ 	cat << EOF > /opt/bro/share/bro/disable-syslog/__load__.zeek
+@load ./disable-syslog
 EOF
  
  	# Configure Zeek to load disable-syslog
