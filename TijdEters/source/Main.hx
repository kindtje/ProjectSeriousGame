package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		FlxG.fullscreen = true;
		addChild(new FlxGame(1280, 720, MenuState));
	}
}