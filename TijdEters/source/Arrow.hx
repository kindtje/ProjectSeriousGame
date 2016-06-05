package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Florian
 */
class Arrow extends FlxSprite
{
	
	var bow : Bow;
	var arrowSpeed : Float = 350;
	var shot : Bool;
	var angleInRadians : Float;
	
	public function new(X:Float, Y:Float, angle : Float) 
	{
		super(X, Y);
		this.y -= this.height / 2;
		this.loadGraphic("assets/images/temp_arrow.png");
		this.scale.x = 0.05;
		this.scale.y = 0.05;
		this.updateHitbox();
		this.angle = angle;
		
		
		angleInRadians = angle * Math.PI / 180;
		velocity.x = Math.cos(angleInRadians) * arrowSpeed;
		velocity.y = Math.sin(angleInRadians) * arrowSpeed;
		
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);	
		
		this.angle += 0.1;
		this.acceleration.y += 0.4;
		
		if (this.x > FlxG.stage.stageWidth || this.y > FlxG.stage.stageHeight || this.y < -50)
		{
			Bow.shotAmount--;
			this.destroy();
		}
	}
	
}