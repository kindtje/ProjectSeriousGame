package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class SpawnAnimals extends FlxObject
{
	public var animalSpawns : FlxTypedGroup<Animal>; 
	var interval : Float = 0;
	var maxInterval : Float = 3;
	
	
	public function new(X:Float, Y:Float, animals : FlxTypedGroup<Animal>) 
	{
		super(X, Y);
		animalSpawns = animals;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		interval += FlxG.elapsed;
		
		if (interval > maxInterval)
		{
			var yPos = Std.random(300);
			var newAnimal = new Animal(FlxG.stage.stageWidth + 50, yPos + 250);
			animalSpawns.add(newAnimal);
			interval = 0;
			if (maxInterval > 0.5)
			{
				maxInterval -= 0.01;
			}
		}
	}
}