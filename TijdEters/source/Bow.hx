package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class Bow extends FlxSprite
{
	public var arrows : FlxTypedGroup<Arrow>;
	var shot : Bool;
	public static var shotAmount: Int = 0;

	public function new(X:Float, Y:Float, arrow: FlxTypedGroup<Arrow>) 
	{
		super(X, Y);
		this.y -= this.height / 2;
		arrows = arrow;
		this.loadGraphic("assets/images/temp_bow.png");
		this.scale.x = 0.1;
		this.scale.y = 0.1;
		this.updateHitbox();
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		var Xdistance : Float = FlxG.mouse.x - this.x;
		var Ydistance : Float = FlxG.mouse.y - this.y;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;
		
		if (FlxG.keys.justPressed.SPACE && !shot && shotAmount < 7)
		{
			shot = true;
			var shoot = new Arrow(this.x, this.y + this.height / 2, this.angle);
			arrows.add(shoot);
			shotAmount++;
		}
		if (FlxG.keys.justReleased.SPACE)
		{
			shot = false;
			
		}
	}
	
}