package;

import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxTween;
import lime.math.Vector2;

/**
 * ...
 * @author Florian
 */
class FallingObjects extends FlxObject
{
	var fallingSpots : Array<Float> = new Array<Float>();
	var fallingFood : FlxTypedGroup<Food>;
	var explosion :FlxTypedGroup<FlxEmitter>;
	
	var amountRows : Int = 7;
	var interval : Float = 0;
	var maxInterval : Float = 1;
	var chance : Int = 55;
	var typeGame : Int;
	var speedFood : Int;
	
	var lastSpot : Float;

	
	public function new(X:Float=0, Y:Float= 0, gameType :Int, fallingObject :FlxTypedGroup<Food>, foodSpeed : Int, _explosion :FlxTypedGroup<FlxEmitter> ) 
	{
		super(X, Y);
		
		fallingFood = fallingObject;
		explosion = _explosion;
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
		super.update(elapsed);
		
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
			
			var newObject = new Food(fallingSpots[spot], -100, type, typeGame, speedFood, explosion);
			fallingFood.add(newObject);
			lastSpot = fallingSpots[spot];
			maxInterval -= 0.0001;
			interval = 0;
		}
		
		
	}
}