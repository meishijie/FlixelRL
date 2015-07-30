package jp_2dgames.game.state;
import jp_2dgames.game.event.EventNpc;
import jp_2dgames.game.util.DirUtil;
import flash.display.BlendMode;
import flash.filters.BlurFilter;
import flixel.effects.FlxSpriteFilter;
import flixel.util.FlxColor;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

private class MyButton extends FlxButtonPlus {

  public function new(X:Float = 0, Y:Float = 0, ?Text:String, ?OnClick:Void->Void) {
    var w = 200; // ボタンの幅
    var h = 40;  // ボタンの高さ
    var s = 20;  // フォントのサイズ
    super(X, Y, OnClick, Text, w, h);
    textNormal.size = s;
    textHighlight.size = s;
  }
}

/**
 * タイトル画面
 **/
class TitleState extends FlxState {

  // ■定数

  // ロゴ
  private static inline var LOGO_Y = -160;
  private static inline var LOGO_Y2 = 64;
  private static inline var LOGO_SIZE = 64;

  // ロゴ背景
  private static inline var LOGO_BG_Y = LOGO_Y2 + LOGO_SIZE/2;

  // ユーザ名
  private static inline var USER_NAME_POS_X = 8;
  private static inline var USER_NAME_OFS_Y = -60;



  // ■メンバ変数
  // PLEASE CLICK ボタン
  private var _btnClick:MyButton;

  /**
   * 生成
   **/
  override public function create():Void {
    super.create();

    // 背景画像
    var bg = new FlxSprite(0, 0, "assets/images/title.png");
    this.add(bg);
    // フェード表示
    var a = 0.8; // アルファ値
    bg.alpha = 0;
    FlxTween.tween(bg, {alpha:a}, 1, {ease:FlxEase.expoOut});
    // スクロール
    bg.y = -bg.height + FlxG.height;
    FlxTween.tween(bg, {y:0}, 30, {ease:FlxEase.sineOut});

    // ロゴの背景
    var bgLogo = new FlxSprite(FlxG.width/2, LOGO_BG_Y).makeGraphic(FlxG.width, 4, FlxColor.WHITE);
    bgLogo.blend = BlendMode.ADD;
    bgLogo.alpha = 0;
    bgLogo.x = 0;
    FlxTween.tween(bgLogo, {alpha:0.2}, 1, {ease:FlxEase.expoIn});
    {
      var filter = new FlxSpriteFilter(bgLogo);
      var blur = new BlurFilter(0, 8);
      filter.addFilter(blur);
      filter.applyFilters();
    }
    this.add(bgLogo);

    // タイトルロゴ
    var txtLogo = new FlxText(FlxG.width/2, LOGO_Y, 320, "1 Rogue", LOGO_SIZE);
    txtLogo.color = FlxColor.WHITE;
    txtLogo.x -= txtLogo.width/2;
    txtLogo.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.GOLDENROD, 8);
    this.add(txtLogo);
    FlxTween.tween(txtLogo, {y:LOGO_Y2}, 1, {ease:FlxEase.expoOut});

    // コピーライト
    var txtCopyright = new FlxText(FlxG.width/2, FlxG.height-32, 480);
    txtCopyright.x = txtCopyright.width/2;
    txtCopyright.text = "(c) 2015 2dgames.jp All right reserved.";
    txtCopyright.setFormat(null, 16);
    this.add(txtCopyright);

    // クリックボタン
    var px = FlxG.width/2 - 100;
    var py = FlxG.height/2;
    _btnClick = new MyButton(px, py, "PLEASE CLICK", function() {
      // 背景を暗くする
      FlxTween.color(bg, 1, FlxColor.WHITE, FlxColor.GRAY, a, a, {ease:FlxEase.expoOut});
      // ロゴを追い出す
      FlxTween.tween(txtLogo, {y:LOGO_Y}, 1, {ease:FlxEase.expoOut});
      // ロゴ背景を消す
      FlxTween.tween(bgLogo, {alpha:0.0}, 1, {ease:FlxEase.expoOut});
      // コピーライトを追い出す
      FlxTween.tween(txtCopyright, {y:FlxG.height+32}, 1, {ease:FlxEase.expoOut});
      // メニュー表示
      _appearMenu();
    });
    this.add(_btnClick);
  }

  /**
   * メニュー表示
   **/
  private function _appearMenu():Void {

    // ユーザー名
    var py = FlxG.height + USER_NAME_OFS_Y;
    var txtUserName = new FlxText(-480, py, 480, "", 20);
    txtUserName.text = "YOUR NAME: " + GameData.getName();
    FlxTween.tween(txtUserName, {x:USER_NAME_POS_X}, 1, {ease:FlxEase.expoOut});
    this.add(txtUserName);

    // プレイヤー表示
    var player = new EventNpc();
    player.revive();
    player.init("player", 1, 12, Dir.Down);
    this.add(player);

    // 各種ボタン
    var btnList = new List<MyButton>();
    var px = FlxG.width;
    var py = 160;
    // NEW GAME
    btnList.add(new MyButton(px, py, "NEW GAME", function(){ FlxG.switchState(new PlayInitState()); }));
    py += 64;
    // CONTINUE
    var btnContinue = new MyButton(px, py, "CONTINUE", function() {
      // セーブデータから読み込み
      Global.SetLoadGame(true);
      FlxG.switchState(new PlayState());
    });
    if(Save.isContinue()) {
      py += 64;
      btnList.add(btnContinue);
    }
    // NAME ENTRY
    btnList.add(new MyButton(px, py, "NAME ENTRY", function() {
      // HACK: SubStatから戻ってきたときに再び呼び出されてしまうため
      if(subState == null) {
        openSubState(new NameEntryState());
      }
    }));
    py += 64;
    // TODO: オープニングをすでに見たときのみ表示
    // OPENING
    btnList.add(new MyButton(px, py, "OPENING", function(){ FlxG.switchState(new OpeningState()); }));

    var px2 = FlxG.width/2 - 100;
    var idx:Int = 0;
    for(btn in btnList) {
      FlxTween.tween(btn, {x:px2}, 1, {ease:FlxEase.expoOut, startDelay:idx*0.1});
      this.add(btn);
      idx++;
    }

    // ボタンを消しておく
    _btnClick.kill();
  }

  /**
   * 破棄
   **/
  override public function destroy():Void {
    super.destroy();
  }

  /**
   * 更新
   **/
  override public function update():Void {
    super.update();

    if(FlxG.keys.pressed.D && FlxG.keys.pressed.SHIFT) {
      // デバッグコマンド
      FlxG.switchState(new DebugState());
    }

  #if neko
    if(FlxG.keys.justPressed.R) {
      FlxG.switchState(new TitleState());
    }
    if(FlxG.keys.justPressed.ESCAPE) {
      throw "Terminaite.";
    }
  #end
  }
}
