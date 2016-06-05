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
	var getScore :Int;
	
	public function new(score : Int) 
	{
		super();
		getScore = score;
		Player.score = 0;
		StoneAgeMini.stoneScore = 0;
	}
	
	override public function create():Void 
	{
				showScore = new FlxText(FlxG.stage.stageWidth / 2, 200);
				showScore.text = "Score: " + Std.int(getScore);
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