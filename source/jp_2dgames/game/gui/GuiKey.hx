package jp_2dgames.game.gui;

import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author meishijie
 */
class GuiKey extends FlxSpriteGroup
{
	private var bg:FlxSpriteButton ;
	
	public function new() 
	{
		super();
		bg = new FlxSpriteButton(0, 0, null, null);
		bg.loadGraphic("assets/images/pad/background.png");
		add(bg);
	}
	
}