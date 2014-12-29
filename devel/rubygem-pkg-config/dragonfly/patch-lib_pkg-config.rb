--- lib/pkg-config.rb.orig	2014-12-29 12:49:13 UTC
+++ lib/pkg-config.rb
@@ -54,8 +54,7 @@ class PackageConfig
         pkg_config = found_pkg_config if found_pkg_config
       end
       unless pkg_config.absolute?
-        found_pkg_config = search_pkg_config_by_dln_find_exe(pkg_config)
-        pkg_config = found_pkg_config if found_pkg_config
+        pkg_config = "/usr/local/bin/pkg-config"
       end
       pkg_config
     end
@@ -68,42 +67,6 @@ class PackageConfig
       nil
     end
 
-    def search_pkg_config_by_dln_find_exe(pkg_config)
-      begin
-        require "dl/import"
-      rescue LoadError
-        return nil
-      end
-      dln = Module.new
-      dln.module_eval do
-        if DL.const_defined?(:Importer)
-          extend DL::Importer
-        else
-          extend DL::Importable
-        end
-        begin
-          dlload RbConfig::CONFIG["LIBRUBY"]
-        rescue RuntimeError
-          return nil if $!.message == "unknown error"
-          return nil if /: image not found\z/ =~ $!.message
-          raise
-        rescue DL::DLError
-          return nil
-        end
-        begin
-          extern "const char *dln_find_exe(const char *, const char *)"
-        rescue DL::DLError
-          return nil
-        end
-      end
-      path = dln.dln_find_exe(pkg_config.to_s, nil)
-      if path.nil? or path.size.zero?
-        nil
-      else
-        Pathname(path.to_s)
-      end
-    end
-  end
 
   attr_reader :paths
   attr_accessor :msvc_syntax