package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;


class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		add(new FlxText(150, 90, 120, "Tijd Eters", 10, true));
		FlxG.camera.bgColor = 0xFFBADA55;
		
		add(new FlxButton(155, 110, "Main game", GoMain));
		add(new FlxButton(155, 130, "Main mini game", goMainMini));
		add(new FlxButton(155, 150, "Mideavle mini game", GoMidEavle));
		
	}
	
	public function GoMain() 
	{
		FlxG.switchState(new MainGame(true));
	}
	
	function goMainMini() 
	{
		FlxG.switchState(new MainMiniState(50));
	}
	
	function GoMidEavle()
	{
		FlxG.switchState(new MidEavleMini());
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
