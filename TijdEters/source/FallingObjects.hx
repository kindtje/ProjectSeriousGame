package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class FallingObjects extends FlxObject
{
	var fallingSpots : Array<Float> = new Array<Float>();
	var fallingFood : FlxTypedGroup<Food>;
	
	var amountRows : Int = 5;
	var interval : Float = 0;
	var maxInterval : Float = 2;
	var chance : Int = 55;
	var typeGame : Int;
	var speedFood : Int;
	
	var lastSpot : Float;
	
	public function new(X:Float=0, Y:Float= 0, gameType :Int, fallingObject :FlxTypedGroup<Food>, foodSpeed : Int ) 
	{
		super(X, Y);
		
		fallingFood = fallingObject;
		speedFood = foodSpeed;
		typeGame = gameType;
		
		//making the falling rows
		var rowWidth = FlxG.stage.stageWidth / amountRows;
		var rowPlace = rowWidth / 2;
		
		for (place in 1...(amountRows + 1))
		{
			var spot = place * rowWidth + rowPlace;
			fallingSpots.push(spot);
		}
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		interval += FlxG.elapsed;
		if (interval > maxInterval)
		{
			var tempChance : Int = Std.random(chance);
		
			
			var spot : Int = Std.random(amountRows) - 1;
			
			if (lastSpot == fallingSpots[spot])
			{
				spot = Std.random(amountRows) - 1;
			}
			
			var type : Int;
			
			if (tempChance < 50)
			{
				type = 1;
				chance++;
			}
			else
			{
				type = 2;
				chance = 55;
			}
			
			var newObject = new Food(fallingSpots[spot], -10, type, typeGame, speedFood);
				fallingFood.add(newObject);
			lastSpot = fallingSpots[spot];
				maxInterval -= 0.02;
			interval = 0;
		}
		
		super.update(elapsed);
	}
	
}