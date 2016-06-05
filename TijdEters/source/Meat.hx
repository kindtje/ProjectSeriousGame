package;

import flixel.FlxG;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Florian
 */
class Meat extends FlxButton
{
	var timer : Float = 0;
	
	public function new(X:Float, Y:Float, type:Int, OnClick:Void->Void) 
	{
		super(X, Y, OnClick);
		switch(type)
		{
			case 1:
				this.loadGraphic("assets/images/meat .png", false, 30, 30);
				this.ID = 1;
			case 2:
				this.loadGraphic("assets/images/wool.png", false, 30, 30);
				this.ID = 2;
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		timer += FlxG.elapsed;
		
		if (timer > 2)
		{
			this.destroy();
		}
	}
	
	
}