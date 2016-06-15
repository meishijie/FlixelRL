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
	private var bg1:FlxVirtualPad;
	
	public function new() 
	{
		super();
		/*bg = new FlxSpriteButton(0, 0, null, null);
		bg.loadGraphic("assets/images/pad/background.png");
		add(bg);*/
		bg1 = new FlxVirtualPad(FlxDPadMode.FULL, FlxActionMode.A_B_X_Y);
		add(bg1);
		bg1.y -= 50;
	}
	
}