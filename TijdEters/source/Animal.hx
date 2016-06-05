package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Florian
 */
class Animal extends FlxSprite
{
	public var movementSpeed = 100;
	
	var randomAnimal : Int;
	var randomHeight : Int;
	var walkHeight : Float;
	
	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		randomAnimal = Std.random(2);
		
		switch(randomAnimal)
		{
			case 0:
				this.loadGraphic("assets/images/temp_wolf.png");
				this.ID = 1;
				this.health = 2;
				
			case 1:
				this.loadGraphic("assets/images/temp_sheep.png");
				this.ID = 2;
		}
		
		this.scale.x = 0.4;
		this.scale.y = 0.4;
		this.width = 100;
		this.height = 100;
		this.centerOffsets();
		this.updateHitbox();
		this.solid = true;
		
		this.velocity.x = -movementSpeed;
		this.velocity.y = movementSpeed / 4;
		
		randomHeight = Std.random(6);
		
		switch(randomHeight)
		{
			case 0:
				walkHeight = FlxG.stage.stageHeight - 100;
			case 1:
				walkHeight = FlxG.stage.stageHeight - 200;
			case 2:
				walkHeight = FlxG.stage.stageHeight - 150;
			case 3:
				walkHeight = FlxG.stage.stageHeight - 250;
			case 4:
				walkHeight = FlxG.stage.stageHeight - 70;
			case 5:
				walkHeight = FlxG.stage.stageHeight - 270;
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (this.y >= walkHeight)
		{
			this.velocity.y = 0;
		}
		
		if (this.y + this.height > FlxG.stage.stageHeight)
		{
			this.velocity.y = -movementSpeed / 4;
		}
		
		
		
	}	
}