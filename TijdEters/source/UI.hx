package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;

/**
 * ...
 * @author Florian
 */
class UI extends FlxObject
{
	public var showScore:FlxText;
	public var showTime:FlxText;
	
	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		
		showScore = new FlxText(10, 10);
		showScore.text = "Score: " + Player.score;
		showScore.size = 15;
		
		showTime = new FlxText(FlxG.stage.stageWidth - 100);
		showTime.text = "Tijd: " + Std.int(Player.timer);
		showTime.size = 15;
	}
	
	override public function update(elapsed:Float):Void 
	{
		showScore.text = "Score: " + Player.score;
		showTime.text = "Tijd: " + Std.int(Player.timer);

		super.update(elapsed);
	}
	
}