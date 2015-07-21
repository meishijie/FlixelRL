package jp_2dgames.game.state;
import jp_2dgames.lib.TmxLoader;
import jp_2dgames.lib.Layer2D;
import flash.events.Event;
import jp_2dgames.game.util.DirUtil;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import jp_2dgames.game.event.EventNpc;
import flixel.FlxState;

/**
 * オープニング画面
 **/
class OpeningState extends FlxState {

  var playerID:Int = 0;
  var catID:Int = 0;

  /**
   * 生成
   **/
  override public function create():Void {
    super.create();

    var tmx = new TmxLoader();
    tmx.load("assets/events/001.tmx", "assets/events/");

    EventNpc.parent = new FlxTypedGroup<EventNpc>(32);
    for(i in 0...EventNpc.parent.maxSize) {
      var npc = new EventNpc();
      npc.ID = i;
      this.add(npc);
      EventNpc.parent.add(npc);
    }

    // TODO:
    playerID = EventNpc.add("player", 8, 1, Dir.Up);
    catID = EventNpc.add("cat", 4, 4, Dir.Down);
    EventNpc.forEach(catID, function(npc:EventNpc) {
      npc.requestRandomWalk(true);
    });
  }

  /**
   * 破棄
   **/
  override public function destroy():Void {
    EventNpc.parent = null;
    super.destroy();
  }

  /**
   * 更新
   **/
  override public function update():Void {
    super.update();

    if(FlxG.keys.justPressed.ENTER) {
      EventNpc.forEach(playerID, function(npc:EventNpc) {
        npc.requestWalk(Dir.Down);
      });
    }

    // デバッグ処理
    updateDebug();
  }

  private function updateDebug():Void {
#if neko
    if(FlxG.keys.justPressed.ESCAPE) {
      throw "Terminate.";
    }
#end
    // デバッグ処理
    if(FlxG.keys.justPressed.R) {
      FlxG.switchState(new OpeningState());
    }
  }
}
