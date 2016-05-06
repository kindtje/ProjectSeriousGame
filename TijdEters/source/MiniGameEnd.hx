package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Florian
 */
class MiniGameEnd extends FlxState
{
	public var showScore:FlxText;
	public var backButton:FlxButton;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
				showScore = new FlxText(FlxG.stage.stageWidth / 2, 200);
				showScore.text = "Score: " + Std.int(Player.score);
				showScore.size = 15;
				add(showScore);
				
				backButton = new FlxButton(FlxG.stage.stageWidth / 2 , 300, "Oké", goBack);
				add(backButton);
				
				
		super.create();
	}
	
	public function goBack() 
	{
		FlxG.switchState(new MainGame(false));
	}
}