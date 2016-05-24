package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class RomanMini extends FlxState
{
	
	
	public function new() 
	{
		super();
		
	}
	
	override public function create():Void 
	{
		super.create(); 
		
		var bg:FlxSprite = new FlxSprite(0, -100);
        bg.loadGraphic("assets/images/Background Roman.png");
		bg.scale.x = 1.1;
		add(bg);
		
		var arrow = new FlxTypedGroup<Arrow>();
			add(arrow);	
			
		var bow : Bow = new Bow(10, FlxG.stage.stageHeight / 2, arrow);
		add(bow);
		
		
		
	}
	
}