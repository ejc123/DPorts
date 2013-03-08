
$FreeBSD: ports/misc/cdcollect/files/patch-src_DBsql.cs,v 1.2 2012/11/17 05:59:33 svnexp Exp $

--- src/DBsql.cs.orig
+++ src/DBsql.cs
@@ -958,10 +958,10 @@
 	private int sql_command_id (string comm)
 	{	
 		IDbCommand command = sqlite_connection.CreateCommand ();
-		command.CommandText = comm;
-		command.ExecuteScalar ();
+		command.CommandText = comm + "; SELECT last_insert_rowid() AS [ID]";
+		string s = command.ExecuteScalar ().ToString ();
 		command.Dispose ();
-		return (((SqliteConnection)sqlite_connection).LastInsertRowId);
+		return Int32.Parse (s);
 	}
 	
 	private void sql_command (string comm)
