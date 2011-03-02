// 天狼基本システムのインクルード。必ず記述する
sirius.require('startup.js');

// kHelperをインクルードする
sirius.require('multi/kHelper/startup.js');

// wHelperをインクルードする
sirius.require('multi/wHelper/startup.js');

// kHelperで表示する、入力済文字ガイドの数
// あまり多すぎると重くなるので注意
kHelper.beforeKeyGuide = 4;

// デフォルトのエディタの指定
// パスが通っていない実行ファイルを指定する場合は、フルパスを記述する。
// edit()関数では、ここで指定したエディタが利用される
sirius.editor = 'notepad';

// 以下は利用するキー配列をJScriptのArray()として定義している。///////////////////////////

// kHelperの機能をマッピングする。このマップは、Ctrl+Alt+kに続く
// ２ストロークメニューである。
var map_kHelper = [
 // kHelperの起動
 assign('', 'k', kHelper.toggle, false),

 // レッスンモードに移行
 assign('', 'l', kHelper.toggleLessonMode, false),
];

// 特別な機能を実現するためのマップで、Ctrl+Altの同時押下時の処理を記述している。
// 利用中のホットキーとバッティングする場合は、適切な物に変更しなくてはならない
var map_sp = [
 // kHelper関連機能の２ストロークマップ
 assign('', 'k', false, map_kHelper),

 // 天狼設定ファイルのリロード
 // assign('', 'l', function(){sirius.reload();}, false),

 // 天狼設定ファイルをエディタで編集する
 // assign('', 'c', function(){sirius.edit();}, false),

 // imeの未確定文字列を住所とみなし、Google Map APIを利用し座標に変換
 // この機能を実装すると、天狼起動時にGoogle Map APIの初期化が行われるため、
 // インターネットへの接続が求められる。その際、セキュリティソフトのブロック
 // によって正しく実行できない場合があるので注意。
 // assign('IMESTR+', 'p', sirius.require('function/googleLatLng.js'), false),

 // imeの未確定文字列をGoogleで検索
 assign('IMESTR+', 'g', sirius.require('function/googleSearch.js'), false)

];

// IMEの補佐機能を実現するマップ。IMEオン時に未確定文字列があり、Ctrlキーが
// 押されていた場合の処理を示している。
var map_ime = [
    // 未確定文字を入力した通りのアルファベットに戻す
    // IMEの英字変換機能に近い物だが、現状では使い勝手があまり良くないので改良予定
    assign('', 'o', function(){sirius.natureSend();}, false)
];

// siriusCommand機能の指定
// 利用したい場合は、グローバルマップ内の「siriusCommand機能の設定」というコメントの
// 次の行を、コメントインして下さい。
var map_ctrl_at = [
    assign('C+', 'jp-@', sirius.require('function/execPipe.js')),       // CUIコマンドの実行
    assign('C+', 'jp-[', sirius.require('function/execScript.js')),     // JScriptの実行
    assign('C+', 'w', sirius.require('function/sameWidth.js')),         // 改行整形処理
    assign('C+', 't', sirius.require('function/csvToHtmlTableEx.js')),  // CSVデータをHTMLの表に変換
    assign('C+', 'u', sirius.require('function/lineToHtmlUl.js')),      // 各行をHTMLのリストに変換
    assign('C+', '1', sirius.require('function/htmlSpecialChars.js')),  // HTMLの特殊文字を変換
];

// notepad
var notepad_c_map = [
    // cursor move
    assignVk('WACLASS<Notepad>+C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'e', '', 'VK_END'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'k', '', 'VK_UP'),

    // page move
    assignVk('WACLASS<Notepad>+C+A-S-', 'v', '', 'VK_NEXT'),

    // edit
    assignVk('WACLASS<Notepad>+C+A-S-', 'd', '', 'VK_DELETE'),
    assignVk('WACLASS<Notepad>+C+A-S-', 'y', 'C+', 'v'),
    assign('WACLASS<Notepad>+C+A-S-', 'n', killLine),
];

var notepad_a_map = [
    // page move
    assignVk('WACLASS<Notepad>+C-A+S-', 'v', '', 'VK_PRIOR'),
    assignVk('WACLASS<Notepad>+C-A+S-', 's', 'C+', 'f'),
];

// Google chrome
var chrome_c_map = [
    // cursor move
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'e', '', 'VK_END'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'k', '', 'VK_UP'),

    // edit
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'd', '', 'VK_DELETE'),
    assign('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'u', killLine),

    // search
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 's', 'C+', 'f'),

    // tab move
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'n', 'C+', 'VK_TAB'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'p', 'C+S+', 'VK_TAB'),

    // mac like open other tab
    assignVk('WACLASS<Chrome_WidgetWin_0>+C+A-S-', 'o', 'A+', 'VK_RETURN'),
];

var chrome_a_map = [
    // downloads
    assignVk('WACLASS<Chrome_WidgetWin_0>+C-A+S-', 'd', 'C+', 'j'),
    // tab move
    assignVk('WACLASS<Chrome_WidgetWin_0>+C-A+S-', 'j', 'C+', 'VK_TAB'),
    assignVk('WACLASS<Chrome_WidgetWin_0>+C-A+S-', 'k', 'C+S+', 'VK_TAB'),

    // history
    assignVk('WACLASS<Chrome_WidgetWin_0>+C-A+S-', 'h', 'C+', 'h'),
];

// あふ
var afx_c_map = [
    // cursor move
    assignVk('WACLASS<TAfxWForm>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<TAfxWForm>+C+A-S-', 'k', '', 'VK_UP'),

    // tab
    assignVk('WACLASS<TAfxWForm>+C+A-S-', 'i', '', 'VK_TAB'),
];

// explorer
var explorer_c_map = [
    // cursor move
    assignVk('WACLASS<CabinetWClass>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<CabinetWClass>+C+A-S-', 'k', '', 'VK_UP'),
    assignVk('WACLASS<CabinetWClass>+C+A-S-', 'v', '', 'VK_NEXT'),
];

var explorer_a_map = [
    // cursor_move
    assignVk('WACLASS<CabinetWClass>+C-A+S-', 'v', '', 'VK_PRIOR'),
    // directory move
    assignVk('WACLASS<CabinetWClass>+C-A+S-', 'j', '', 'VK_RETURN'),
    assignVk('WACLASS<CabinetWClass>+C-A+S-', 'k', '', 'VK_BACK'),
    // history move
    assignVk('WACLASS<CabinetWClass>+C-A+S-', 'h', 'A+', 'VK_LEFT'),
    assignVk('WACLASS<CabinetWClass>+C-A+S-', 'l', 'A+', 'VK_RIGHT'),
];

// PowerPoint2003
var powerpnt_c_map = [
    // cursor move
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'e', '', 'VK_END'),
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'k', '', 'VK_UP'),
    // edit
    assignVk('WACLASS<PP11FrameClass>+C+A-S-', 'd', '', 'VK_DELETE'),
];

// Word2003
var word_c_map = [
    // cursor move
    assignVk('WACLASS<OpusApp>+C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('WACLASS<OpusApp>+C+A-S-', 'e', '', 'VK_END'),
    assignVk('WACLASS<OpusApp>+C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('WACLASS<OpusApp>+C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('WACLASS<OpusApp>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<OpusApp>+C+A-S-', 'k', '', 'VK_UP'),
    // edit
    assignVk('WACLASS<OpusApp>+C+A-S-', 'd', '', 'VK_DELETE'),
];

// Excel2003
var excel_c_map = [
    // cursor move
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'e', '', 'VK_END'),
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'k', '', 'VK_UP'),
    // edit
    assignVk('WACLASS<XLMAIN>+C+A-S-', 'd', '', 'VK_DELETE'),
];

// my functions
function killLine() {
    sirius.send('S+', 35);
    sirius.send('', 46);
}


// グローバルマップ
// この配列を天狼に渡す事で、キー配列を知らせている。
var map_global = [
    //assign('C+', '1', killLine),
    //assign('WACLASS<Notepad>+C-A+S-', 'n', killLine),

    // 特別な機能を実行するためのマップ
    includeMap('C+A+IMESTR/', map_sp),

    // wHelperの起動
    //assign('A+C+', 'w', wHelper.toggle, false),

    // siriusCommand機能の設定
    // assign('C+', 'jp-@', false, map_ctrl_at),

    /*
        漢直マップのインクルード
        利用したい配列をコメントインして利用。
     */

    // チョイ入力
    // テンキーを利用したひらがな入力です。他の漢直と併用できます。
    // 他の漢直と併用する場合で、かつkHelperを利用する場合は、他の
    // 漢直より先にストロークマップをインクルードして下さい。
    // includeMap('IME+IMESTR/', sirius.require('map/choi.js')),

    // T-Code
    includeKMap('IME+IMESTR/', 'map/t.js'),    // 106キーボード用
    // includeKMap('IME+IMESTR/', 'map/t-us.js'), // 101キーボード用

    // TUT-Code
    // includeKMap('IME+IMESTR/', 'map/tut.js'),   // 106キーボード用
    // includeKMap('IME+IMESTR/', 'map/tut-us.js'),// 101キーボード用

    // 超絶技巧入力
    // includeKMap('IME+IMESTR/', 'map/chouzetsu.js'),    // 106キーボード用
    // includeKMap('IME+IMESTR/', 'map/chouzetsu-us.js'), // 101キーボード用

    // G-Code
    // includeKMap('IME+IMESTR/', 'map/g.js'),   // 106キーボード用
    // includeKMap('IME+IMESTR/', 'map/g-us.js'),// 101キーボード用

    // 百相鍵盤『き』
    // includeKMap('S/IME+IMESTR/', 'map/ki.js'),   // 106キーボード用
    // 百相鍵盤『き』は101キーボード用の配列はありません

    /* 
       漢直用バックスペースの設定

       漢直利用時に併用すると便利なバックスペース機能です。
       微妙な機能の差に応じて３種類あります。モディファイアとキー
       は任意に指定できますが、IMEに未確定文字列が存在する事を示す
       'IMESTR+'モディファイアは、必ず指定して下さい。
    */
    // assign('IMESTR+A-C+S-', 'h', siriusKanchokuController.back),
    // assign('IMESTR+A+C+S-', 'h', siriusKanchokuController.rollback),
    // assign('IMESTR+A+C+S+', 'h', siriusKanchokuController.lose),

    /*
        その他のキーアサインの変更。利用したい物をコメントインする
    */

    // すべてのアプリケーションで、Ctrl+M 押下時にリターンキーを送信
    assignVk('C+A-S-', 'm', '', 'VK_RETURN'),

    /*
    assignVk('C+A-S-', 'a', '', 'VK_HOME'),
    assignVk('C+A-S-', 'b', '', 'VK_LEFT'),
    assignVk('C+A-S-', 'd', '', 'VK_DELETE'),
    assignVk('C+A-S-', 'e', '', 'VK_END'),
    assignVk('C+A-S-', 'f', '', 'VK_RIGHT'),
    assignVk('C+A-S-', 'j', '', 'VK_DOWN'),
    assignVk('C+A-S-', 'k', '', 'VK_UP'),
    */

    // notepad
    includeMap('WACLASS<Notepad>+C+A-S-', notepad_c_map),
    includeMap('WACLASS<Notepad>+C-A+S-', notepad_a_map),

    // Google chrome
    includeMap('WACLASS<Chrome_WidgetWin_0>+C+A-S-', chrome_c_map),
    includeMap('WACLASS<Chrome_WidgetWin_0>+C-A+S-', chrome_a_map),

    // あふ
    includeMap('WACLASS<TAfxWForm>+C+A-S-', afx_c_map),

    // explorer
    includeMap('WACLASS<CabinetWClass>+C+A-S-', explorer_c_map),
    includeMap('WACLASS<CabinetWClass>+C-A+S-', explorer_a_map),

    // PowerPoint2003
    includeMap('WACLASS<PP11FrameClass>+C+A-S-', powerpnt_c_map),

    // Word2003
    includeMap('WACLASS<OpusApp>+C+A-S-', word_c_map),

    // Excel2003
    includeMap('WACLASS<XLMAIN>+C+A-S-', excel_c_map),

    // global volume control
    assignVk('C+A+S-', 'jp--', '', 'VK_VOLUME_DOWN'),
    assignVk('C+A+S-', 'jp-;', '', 'VK_VOLUME_UP'),

    // toggle IME
    assignVk('C+', 'VK_SPACE', '', 'VK_KANJI'),

    // すべてのアプリケーションで、Ctrl+H 押下時にバックスペースを送信
    assignVk('C+A-S-', 'h', '', 'VK_BACK'),
];

// ストロークマップを天狼に渡して初期化終了
siriusFlow.setupMap(map_global);

// kHelperの横幅を13に変更（百相鍵盤『き』を利用する時に設定して下さい）
// kHelper.width = 13;

