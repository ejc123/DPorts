
$FreeBSD: head/lang/erlang-runtime15/files/patch-lib_et_src_et__gs__contents__viewer.erl 340725 2014-01-22 17:40:44Z mat $

--- lib/et/src/et_gs_contents_viewer.erl.orig	2010-03-11 16:24:41.000000000 +0800
+++ lib/et/src/et_gs_contents_viewer.erl	2010-03-11 16:24:53.000000000 +0800
@@ -347,7 +347,6 @@ handle_info({gs, _Obj, keypress, _, [Key
         'Caps_Lock' ->
             {noreply, S};
         _ ->
-            io:format("~p: ignored: ~p~n", [?MODULE, KeySym]),
             {noreply, S}
     end;
 handle_info({gs, _Obj, configure, [], [W, H | _]}, S) ->
