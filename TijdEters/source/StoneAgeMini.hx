package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Florian
 */
class StoneAgeMini extends FlxState
{
	
	public var interval : Float = 0;
	public var maxInterval : Float = 1;
	public var berryList : Array<Berry>;
	public var badBerry : Int;
	var j : Int = 0;
	public static var stoneScore : Int = 0;
	public static var stoneTimer : Float = 50;
	var ui : UI;
	
	var lastSpots : List<FlxPoint>;
	
	public function new() 
	{
		super();
		berryList = new Array<Berry>();
		badBerry = Std.random(5) + 1;
		
	}
	
	override public function create():Void 
	{
		super.create();
		
		var bg:FlxSprite = new FlxSprite(0, -250);
        bg.loadGraphic("assets/images/Background Berries.png");
		bg.scale.x = 1.1;
		add(bg);
		
		ui = new UI(0, 0, "stonemini");
		add(ui);
		add(ui.showScore);
		add(ui.showTime);
		
		var berryBad : FlxSprite = new FlxSprite(FlxG.stage.stageWidth / 2,  0, "assets/images/berrie" + badBerry + ".png");
		berryBad.scale.x = 0.2;
		berryBad.scale.y = 0.2;
		berryBad.updateHitbox();
		add(berryBad);
		
		var handSprite = new FlxSprite(0, 0, "assets/images/hand cursor.png");
		FlxG.mouse.load(handSprite.pixels);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		stoneTimer -= FlxG.elapsed;
		
		interval += FlxG.elapsed;
		
		if (interval > maxInterval)
		{
			var randomY : Int = Std.random(FlxG.stage.stageHeight) +350;
			var randomX : Int = Std.random(FlxG.stage.stageWidth);
			
			if (randomY > FlxG.stage.stageHeight - 100)
			{
				randomY = 450;
			}
			else if (randomX > FlxG.stage.stageWidth - 100)
			{
				randomX -= 400;
			}
			var berry : Berry = new Berry(randomX, randomY, onClick.bind(j), Std.random(5) + 1);
			add(berry);
			berryList.push(berry);
			interval = 0;
			j++;
		}
		
		if (stoneTimer <= 0)
		{
			FlxG.mouse.unload();
			FlxG.switchState(new MiniGameEnd(stoneScore));
		}
	}
	
	public function onClick(berry : Int)
	{
		if (berryList[berry].graphicBerry == "assets/images/berrie" + badBerry + ".png")
		{
			stoneTimer -= 5;
			maxInterval += 0.0003;
		}
		else
		{
			stoneScore += 1;
			maxInterval -= 0.0002;
		}
		
		berryList[berry].destroy();
	}
}