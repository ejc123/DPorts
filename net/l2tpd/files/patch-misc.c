
$FreeBSD: head/net/l2tpd/files/patch-misc.c 340725 2014-01-22 17:40:44Z mat $

--- misc.c	2002/10/22 09:41:27	1.1
+++ misc.c	2002/10/22 09:43:50
@@ -20,7 +20,6 @@
 #if defined(SOLARIS)
 # include <varargs.h>
 #endif
-#include <netinet/in.h>
 #include "l2tp.h"
 
 void log(int level, const char *fmt,...)
