from keyhac import *

def configure(keymap):

    # --------------------------------------------------------------------
    # config.py編集用のテキストエディタの設定

    # プログラムのファイルパスを設定 (単純な使用方法)
    if 1:
        keymap.editor = u"notepad.exe"

    # 呼び出し可能オブジェクトを設定 (高度な使用方法)
    if 0:
        def editor(path):
            shellExecute( None, None, u"notepad.exe", '"%s"'% path, "" )
        keymap.editor = editor

    # --------------------------------------------------------------------

    # キーの単純な置き換え
    #keymap.replaceKey( "LWin", 235 )
    #keymap.replaceKey( "RWin", 255 )
    keymap.replaceKey( "Space", "LCtrl" )
    keymap.replaceKey( 28, "Space" )

    # ユーザモディファイアキーの定義
    keymap.defineModifier( 235, "User0" )

    # どのウインドウにフォーカスがあっても効くキーマップ
    if 1:
        keymap_global = keymap.defineWindowKeymap()

        # USER0-↑↓←→ : 10pixel単位のウインドウの移動
        keymap_global[ "U0-Left"  ] = keymap.command_MoveWindow( -10, 0 )
        keymap_global[ "U0-Right" ] = keymap.command_MoveWindow( +10, 0 )
        keymap_global[ "U0-Up"    ] = keymap.command_MoveWindow( 0, -10 )
        keymap_global[ "U0-Down"  ] = keymap.command_MoveWindow( 0, +10 )

        # USER0-Shift-↑↓←→ : 1pixel単位のウインドウの移動
        keymap_global[ "U0-S-Left"  ] = keymap.command_MoveWindow( -1, 0 )
        keymap_global[ "U0-S-Right" ] = keymap.command_MoveWindow( +1, 0 )
        keymap_global[ "U0-S-Up"    ] = keymap.command_MoveWindow( 0, -1 )
        keymap_global[ "U0-S-Down"  ] = keymap.command_MoveWindow( 0, +1 )

        # USER0-Ctrl-↑↓←→ : 画面の端まで移動
        keymap_global[ "U0-C-Left"  ] = keymap.command_MoveWindow_MonitorEdge(0)
        keymap_global[ "U0-C-Right" ] = keymap.command_MoveWindow_MonitorEdge(2)
        keymap_global[ "U0-C-Up"    ] = keymap.command_MoveWindow_MonitorEdge(1)
        keymap_global[ "U0-C-Down"  ] = keymap.command_MoveWindow_MonitorEdge(3)

        # クリップボード履歴
        keymap_global[ "C-S-Z"   ] = keymap.command_ClipboardList     # リスト表示
        keymap_global[ "C-S-X"   ] = keymap.command_ClipboardRotate   # 直近の履歴を末尾に回す
        keymap_global[ "C-S-A-X" ] = keymap.command_ClipboardRemove   # 直近の履歴を削除
        keymap.quote_mark = "> "                                      # 引用貼り付け時の記号

        # キーボードマクロ
        keymap_global[ "U0-0" ] = keymap.command_RecordToggle
        keymap_global[ "U0-1" ] = keymap.command_RecordStart
        keymap_global[ "U0-2" ] = keymap.command_RecordStop
        keymap_global[ "U0-3" ] = keymap.command_RecordPlay
        keymap_global[ "U0-4" ] = keymap.command_RecordClear


    # USER0-F1 : アプリケーションの起動テスト
    if 1:
        keymap_global[ "U0-F1" ] = keymap.command_ShellExecute( None, None, "notepad.exe", u"", u"" )


    # USER0-F2 : サブスレッド処理のテスト
    if 1:
        def command_JobTest():

            def jobTest(job_item):
                import os
                import sys
                shellExecute( None, None, "notepad.exe", u"", u"" )

            def jobTestFinished(job_item):
                print u"Done."

            job_item = JobItem( jobTest, jobTestFinished )
            JobQueue.defaultQueue().enqueue(job_item)

        keymap_global[ "U0-F2" ] = command_JobTest


    # USER0-F : ウインドウのアクティブ化
    if 1:
        keymap_global[ "U0-F" ] = keymap.command_ActivateWindow( "cfiler.exe", "CfilerWindowClass" )


    # USER0-E : アクティブ化するか、まだであれば起動する
    if 1:
        def command_ActivateOrExecuteNotepad():
            wnd = Window.find( "Notepad", None )
            if wnd:
                if wnd.isMinimized():
                    wnd.restore()
                wnd = wnd.getLastActivePopup()
                wnd.setForeground()
            else:
                executeFunc = keymap.command_ShellExecute( None, None, "notepad.exe", u"", u"" )
                executeFunc()

        keymap_global[ "U0-E" ] = command_ActivateOrExecuteNotepad


    # Ctrl-Tab で、コンソール関係のウインドウを切り替え
    if 1:

        import pyauto

        def isConsoleWindow(wnd):
            if wnd.getClassName() in ("PuTTY","MinTTY","CkwWindowClass"):
                return True
            return False

        keymap_console = keymap.defineWindowKeymap( check_func=isConsoleWindow )

        def command_SwitchConsole():

            root = pyauto.Window.getDesktop()
            last_console = None

            wnd = root.getFirstChild()
            while wnd:
                if isConsoleWindow(wnd):
                    last_console = wnd
                wnd = wnd.getNext()

            if last_console:
                last_console.setForeground()

        keymap_console[ "C-TAB" ] = command_SwitchConsole


    # USER0-Alt-↑↓←→/Space/PageUp/PageDown : キーボードで擬似マウス操作
    if 1:
        keymap_global[ "U0-A-Left"  ] = keymap.command_MouseMove(-10,0)
        keymap_global[ "U0-A-Right" ] = keymap.command_MouseMove(10,0)
        keymap_global[ "U0-A-Up"    ] = keymap.command_MouseMove(0,-10)
        keymap_global[ "U0-A-Down"  ] = keymap.command_MouseMove(0,10)
        keymap_global[ "D-U0-A-Space" ] = keymap.command_MouseButtonDown('left')
        keymap_global[ "U-U0-A-Space" ] = keymap.command_MouseButtonUp('left')
        keymap_global[ "U0-A-PageUp" ] = keymap.command_MouseWheel(1.0)
        keymap_global[ "U0-A-PageDown" ] = keymap.command_MouseWheel(-1.0)


    # sendMessageでシステムコマンドを実行
    if 1:
        def close():
            wnd = keymap.getTopLevelWindow()
            wnd.sendMessage( WM_SYSCOMMAND, SC_CLOSE )

        def screenSaver():
            wnd = keymap.getTopLevelWindow()
            wnd.sendMessage( WM_SYSCOMMAND, SC_SCREENSAVE )

        keymap_global[ "U0-C" ] = close              # ウインドウを閉じる
        keymap_global[ "U0-S" ] = screenSaver        # スクリーンセーバー


    # Editボックスで、C-Dを削除に当てるなど
    if 1:
        keymap_edit = keymap.defineWindowKeymap( class_name=u"Edit" )

        keymap_edit[ "C-D" ] = "Delete"              # 削除
        keymap_edit[ "C-H" ] = "Back"                # バックスペース
        keymap_edit[ "C-K" ] = "S-End","C-X"         # 行末まで切り取り


    # メモ帳を Emacs 風にカスタマイズする
    # keymap_edit の条件と重複するため、keymap_editの設定と混ざって機能する。
    if 1:
        keymap_notepad = keymap.defineWindowKeymap( exe_name=u"notepad.exe", class_name=u"Edit" )

        # Ctrl-X を マルチストロークの1段目として登録
        keymap_notepad[ "C-X" ] = keymap.defineMultiStrokeKeymap("C-X")

        keymap_notepad[ "C-P" ] = "Up"                  # カーソル上
        keymap_notepad[ "C-N" ] = "Down"                # カーソル下
        keymap_notepad[ "C-F" ] = "Right"               # カーソル右
        keymap_notepad[ "C-B" ] = "Left"                # カーソル左
        keymap_notepad[ "C-A" ] = "Home"                # 行の先頭
        keymap_notepad[ "C-E" ] = "End"                 # 行の末尾
        keymap_notepad[ "A-F" ] = "C-Right"             # 単語右
        keymap_notepad[ "A-B" ] = "C-Left"              # 単語左
        keymap_notepad[ "C-V" ] = "PageDown"            # ページ下
        keymap_notepad[ "A-V" ] = "PageUp"              # ページ上
        keymap_notepad[ "A-Comma" ] = "C-Home"          # バッファ先頭
        keymap_notepad[ "A-Period" ] = "C-End"          # バッファ末尾
        keymap_notepad[ "C-X" ][ "C-F" ] = "C-O"        # ファイルを開く
        keymap_notepad[ "C-X" ][ "C-S" ] = "C-S"        # 保存
        keymap_notepad[ "C-X" ][ "C-W" ] = "A-F","A-A"  # 名前を付けて保存
        keymap_notepad[ "C-X" ][ "U" ] = "C-Z"          # アンドゥ
        keymap_notepad[ "C-S" ] = "C-F"                 # 検索
        keymap_notepad[ "A-X" ] = "C-G"                 # 指定行へ移動
        keymap_notepad[ "C-X" ][ "H" ] = "C-A"          # 全て選択
        keymap_notepad[ "C-W" ] = "C-X"                 # 切り取り
        keymap_notepad[ "A-W" ] = "C-C"                 # コピー
        keymap_notepad[ "C-Y" ] = "C-V"                 # 貼り付け
        keymap_notepad[ "C-X" ][ "C-C" ] = "A-F4"       # 終了


    # クリップボード履歴の最大数 (デフォルト:1000)
    keymap.clipboard_history.maxnum = 10000


    # クリップボード履歴リスト表示のカスタマイズ
    if 1:
        import datetime

        # 定型文
        fixed_items = [
            ( u"name@server.net",     u"name@server.net" ),
            ( u"住所",                u"〒東京都品川区123-456" ),
            ( u"電話番号",            u"03-4567-8901" ),
            ( u"config.pyを編集",     keymap.command_EditConfig ),
            ( u"config.pyをリロード", keymap.command_ReloadConfig ),
        ]

        # 日時をペーストする機能
        def dateAndTime(fmt):
            def _dateAndTime():
                return datetime.datetime.now().strftime(fmt)
            return _dateAndTime

        # 日時
        date_and_time_items = [
            ( u"YYYY/MM/DD HH:MM:SS",   dateAndTime("%Y/%m/%d %H:%M:%S") ),
            ( u"YYYY/MM/DD",            dateAndTime("%Y/%m/%d") ),
            ( u"HH:MM:SS",              dateAndTime("%H:%M:%S") ),
            ( u"YYYYMMDD_HHMMSS",       dateAndTime("%Y%m%d_%H%M%S") ),
            ( u"YYYYMMDD",              dateAndTime("%Y%m%d") ),
            ( u"HHMMSS",                dateAndTime("%H%M%S") ),
        ]

        keymap.cblisters += [
            ( u"定型文",         cblister_FixedPhrase(fixed_items) ),
            ( u"日時",           cblister_FixedPhrase(date_and_time_items) ),
            ]

