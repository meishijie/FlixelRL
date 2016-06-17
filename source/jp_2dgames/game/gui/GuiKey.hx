package jp_2dgames.game.gui;

import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxSpriteButton;
import flixel.ui.FlxVirtualPad;

/**
 * ...
 * @author meishijie
 */
class GuiKey extends FlxSpriteGroup
{
	private var bg:FlxSpriteButton ;
	public static var bg1:FlxVirtualPad;
	public static var aUp:Bool = false;
	public static var bUp:Bool = false;
	public static var upUp:Bool = false;
	public static var downUp:Bool = false;
	public static var leftUp:Bool = false;
	public static var rightUp:Bool = false;


	public function new() 
	{
		super();
		/*bg = new FlxSpriteButton(0, 0, null, null);
		bg.loadGraphic("assets/images/pad/background.png");
		add(bg);*/
		bg1 = new FlxVirtualPad(FlxDPadMode.FULL, FlxActionMode.A_B);
		add(bg1);
		bg1.y -= 50;
		bg1.buttonA.onUp.callback = btnAUp;
		bg1.buttonB.onUp.callback = btnBUp;
		bg1.buttonA.onDown.callback = btnADown;
		bg1.buttonB.onDown.callback = btnBDown;
		bg1.buttonUp.onUp.callback = btnUpUp;
		bg1.buttonUp.onDown.callback = btnUpDown;
		bg1.buttonDown.onUp.callback = btnDownUp;
		bg1.buttonDown.onDown.callback = btnDownDown;
		bg1.buttonLeft.onDown.callback = btnLeftDown;
		bg1.buttonLeft.onUp.callback = btnLeftUp;
		bg1.buttonRight.onUp.callback = btnRightUp;
		bg1.buttonRight.onDown.callback = btnRightDown;
	}

	function btnAUp():Void{
		aUp = false;

	}
	
	function btnADown():Void{
		aUp = true;

	}

	function btnBUp():Void{
		bUp = false;

	}
	function btnBDown():Void{
		bUp = true;
		

	}
	function btnUpUp():Void{
		upUp = false;

	}
	function btnUpDown():Void{
		upUp =true ;


	}
	function btnDownUp():Void{
		downUp = false;

	}
	function btnDownDown():Void{
		downUp =true ;


	}

	function btnLeftUp():Void{
		leftUp = false;


	}
	function btnLeftDown():Void{
		leftUp =true ;

	}
	function btnRightUp():Void{
		rightUp = false;

	}
	function btnRightDown():Void{
		rightUp =true ;


	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		//aUp = false;
		//bUp = false;
		//upUp = false;
		//downUp = false;
		//leftUp = false;
		//rightUp = false;

	}

}