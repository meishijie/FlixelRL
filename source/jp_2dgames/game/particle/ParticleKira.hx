package jp_2dgames.game.particle;
import flixel.math.FlxRandom;
import flash.display.BlendMode;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;
/**
 * 状態
 **/
private enum State {
  Main;  // メイン
  Blink; // 点滅
}

/**
 * きらきらエフェクト
 **/
class ParticleKira extends FlxSprite {

  private static inline var TIMER_MAIN:Int = 60;
  private static inline var TIMER_BLINK:Int = 30;

  // パーティクル管理
  public static var parent:FlxTypedGroup<ParticleKira>;

  public static function start(X:Float, Y:Float):Void {
    var p:ParticleKira = parent.recycle();
    p.init(X, Y);
  }

  // メンバ変数
  private var _state:State; // 状態
  private var _timer:Int;   // 汎用タイマー

  /**
   * コンストラクタ
   **/
  public function new() {
    super();
    loadGraphic("assets/images/kira.png");
    // 中心を基準に描画
    offset.set(width / 2, height / 2);
    // 消しておく
    kill();
  }

  /**
   * 初期化
   **/
  public function init(X:Float, Y:Float):Void {
    x = X;
    y = Y;

    var sc = FlxG.random.float(0.5, 1);
    scale.set(sc, sc);
    visible = true;
    velocity.y = -FlxG.random.float(10, 20);
    acceleration.y = -5;
    // 回転させる
    angularVelocity = FlxG.random.float(30, 120);
    angularDrag = 5;

    _timer = TIMER_MAIN;
    _state = State.Main;
  }

  /**
   * 更新
   **/
override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
    switch(_state) {
      case State.Main:
        _timer--;
        if(_timer < 1) {
          _timer = TIMER_BLINK;
          _state = State.Blink;
        }
      case State.Blink:
        _timer--;
        visible = false;
        if(_timer%4 < 2) {
          visible = true;
        }
        if(_timer < 1) {
          // 消滅
          kill();
        }
    }
  }
}
