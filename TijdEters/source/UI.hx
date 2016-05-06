package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Florian
 */
class UI extends FlxObject
{
	public var showScore:FlxText;
	public var showTime:FlxText;
	public var tempTime:FlxText;
	
	var seeScore : Bool;
	
	public function new(X:Float, Y:Float, UIType:String) 
	{
		super(X, Y);
		
		switch(UIType)
		{
			case "minigame":
				showScore = new FlxText(10, 10);
				showScore.text = "Score: " + Player.score;
				showScore.size = 15;
				
				showTime = new FlxText(FlxG.stage.stageWidth - 100);
				showTime.text = "Tijd: " + Std.int(Player.timer);
				showTime.size = 15;
				
				seeScore = true;
				
			case "maingame":
				tempTime = new FlxText(FlxG.stage.stageWidth / 2, 10);
				tempTime.text = MainGame.dagDeel + ": " + MainGame.hour + "." + MainGame.minute;
				tempTime.size = 15;
				
				seeScore = false;
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (seeScore)
		{
			showScore.text = "Score: " + Player.score;
			showTime.text = "Tijd: " + Std.int(Player.timer);
		}
		else
		{
			tempTime.text = MainGame.dagDeel + ": " + MainGame.hour + "." + MainGame.minute;
		}
			
		super.update(elapsed);
	}
	
}