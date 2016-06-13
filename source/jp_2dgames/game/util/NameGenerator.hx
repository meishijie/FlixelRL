package jp_2dgames.game.util;

import flixel.math.FlxRandom;
import openfl.Assets;
import flixel.FlxG;
/**
 * 名前自動生成
 **/
class NameGenerator {
  private var _males:Array<String>;
  private var _females:Array<String>;

  /**
   * コンストラクタ
   **/
  public function new() {
    _males = Assets.getText("assets/data/name/male.cpp").split("\n");
    _females = Assets.getText("assets/data/name/female.cpp").split("\n");
  }

  public function get():String {
    if(FlxG.random.bool()) {
      return getMale();
    }
    else {
      return getFemale();
    }
  }

  public function getMale():String {
    var rnd = FlxG.random.int(0, _males.length-1);
    return _males[rnd];
  }

  public function getFemale():String {
    var rnd =FlxG.random.int(0, _females.length-1);
    return _females[rnd];
  }
}
