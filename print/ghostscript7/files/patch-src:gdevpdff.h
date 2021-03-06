--- src/gdevpdff.h.org	2003-01-17 09:49:02.000000000 +0900
+++ src/gdevpdff.h	2003-09-18 23:42:38.000000000 +0900
@@ -117,6 +117,12 @@
     FONT_SUBSET_NO
 } pdf_font_do_subset_t;
 
+typedef enum {
+    FONT_EMBED_STANDARD,	/* 14 standard fonts */
+    FONT_EMBED_NO,
+    FONT_EMBED_YES
+} pdf_font_embed_t;
+
 struct pdf_font_descriptor_s {
     pdf_resource_common(pdf_font_descriptor_t);
     pdf_font_name_t FontName;
@@ -198,6 +204,7 @@
     gs_font *font;		/* non-0 iff font will notify us; */
 				/* should be a weak pointer */
     int index;			/* in pdf_standard_fonts, -1 if not base 14 */
+    pdf_font_embed_t embed;	/* status of pdf_font_embed_status() */
     gs_matrix orig_matrix;	/* FontMatrix of unscaled font for embedding */
     bool is_MM_instance;	/* for Type 1/2 fonts, true iff the font */
 				/* is a Multiple Master instance */
@@ -320,12 +327,6 @@
 
 /* ---------------- Exported by gdevpdff.c ---------------- */
 
-typedef enum {
-    FONT_EMBED_STANDARD,	/* 14 standard fonts */
-    FONT_EMBED_NO,
-    FONT_EMBED_YES
-} pdf_font_embed_t;
-
 typedef struct pdf_standard_font_s {
     const char *fname;
     gs_encoding_index_t base_encoding;

