package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
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
	
	public var sleep : FlxText;
	public var hunger : FlxText;
	public var _sleep: FlxSprite;
	public var _hunger: FlxSprite;
	public var maxSleep: FlxSprite;
	public var maxHunger: FlxSprite;
	
	public static var sleepInt : Float = 0;
	public static var hungerInt : Float = 50;
	
	var seeScore : Bool;
	var type : String;
	
	public function new(X:Float, Y:Float, UIType:String) 
	{
		super(X, Y);
		type = UIType;
		
		switch(UIType)
		{
			case "minigame":
				showScore = new FlxText(10, 10);
				showScore.text = "Score: " + Player.score;
				showScore.size = 15;
				
				showTime = new FlxText(FlxG.stage.stageWidth - 300);
				showTime.text = "Tijd: " + Std.int(Player.timer);
				showTime.size = 15;
				
				seeScore = true;
				
			case "maingame":
				tempTime = new FlxText(FlxG.stage.stageWidth / 2, 10);
				tempTime.text = TempDataStorage.dagDeel + ": " + TempDataStorage.hour + "." + TempDataStorage.minute;
				tempTime.size = 15;
				
				/*hunger = new FlxText(200, 10);
				hunger.text = "Honger: ";
				maxHunger = new FlxSprite(hunger.x + hunger.width + 4, 10);
				maxHunger.makeGraphic(50, 10, 0xFFC0C0C0);
				_hunger = new FlxSprite(hunger.x + hunger.width + 4, 10);
				_hunger.makeGraphic(Std.int(hungerInt), 10, 0xFF8000FF);
				
				sleep = new FlxText(400, 10);
				sleep.text = "Slaap: ";
				maxSleep = new FlxSprite(sleep.x + sleep.width + 4, 10);
				maxSleep.makeGraphic(50, 10, 0xFFC0C0C0);
				_sleep = new FlxSprite(sleep.x + sleep.width + 4, 10);
				_sleep.makeGraphic(Std.int(sleepInt), 10, 0xFF8000FF);*/
				
				seeScore = false;
				
			case "stonemini":
				showScore = new FlxText(10, 10);
				showScore.text = "Score: " + StoneAgeMini.stoneScore;
				showScore.size = 15;
				
				showTime = new FlxText(FlxG.stage.stageWidth - 300);
				showTime.text = "Tijd: " + Std.int(StoneAgeMini.stoneTimer);
				showTime.size = 15;
				
				seeScore = true;
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (seeScore)
		{
			switch(type)
			{
				case "minigame":
					showScore.text = "Score: " + Player.score;
					showTime.text = "Tijd: " + Std.int(Player.timer);
				
				case "stonemini":
					showScore.text = "Score: " + StoneAgeMini.stoneScore;
					showTime.text = "Tijd: " + Std.int(StoneAgeMini.stoneTimer);
				
			}
		}
		else
		{
			tempTime.text = TempDataStorage.dagDeel + ": " + TempDataStorage.hour + "." + TempDataStorage.minute;
			/*_hunger.makeGraphic(Std.int(hungerInt), 10, 0xFF8000FF);
			_sleep.makeGraphic(Std.int(sleepInt), 10, 0xFF8000FF);*/
		}
			
		super.update(elapsed);
	}
	
}