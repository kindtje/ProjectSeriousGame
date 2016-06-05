package;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;


/**
 * ...
 * @author Florian
 */
class Player extends FlxObject
{
	public var player : FlxSprite;
	public static var basket : FlxSprite;
	
	public static var duck : Bool;
	public static var score : Int = 0;
	public static var timer : Float;
	public static var posY : Float;
	var typeMove : Int;
	var playerSpeed : Int = 500;
	
	
	public function new(X:Float, Y:Float, TypeMov:Int, time:Int) 
	{
		super(X, Y);
		player = new FlxSprite(X, Y);
		
		
		if (TypeMov < 3)
		{
			player.loadGraphic("assets/images/temp_char.png");
			player.y -= player.height;
			player.solid = false;
			
			basket = new FlxSprite(X - 15, y - 20);
			basket.y -= player.height;
			basket.loadGraphic("assets/images/basket.png");
			basket.scale.x = 0.1;
			basket.scale.y = 0.1;
		
			basket.solid = true;
			basket.updateHitbox();
			
			posY = player.y + player.height;
		}
		else
		{
			player.loadGraphic("assets/images/playerTopDown.png");
			player.scale.x = 0.2;
			player.scale.y = 0.2;
			player.updateHitbox();
		}
		typeMove = TypeMov;
		timer = time;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		player.x = this.x;
		
		
		if (typeMove < 3)
		{
			basket.x = this.x - 15;
			
			//Movement type of player
			if (typeMove == 1) 
			{
				
				if (FlxG.keys.anyPressed(["LEFT"]) && !duck) 
				{
					this.velocity.x = -playerSpeed;
					
				}
				
				else if (FlxG.keys.anyPressed(["RIGHT"]) && !duck)
				{
					this.velocity.x = playerSpeed;
				}
				
				else
				{
					this.velocity.x = 0;
				}
				
				if (FlxG.keys.anyPressed(["DOWN"]) && !duck)
				{
					//temp version
					duck = true;
					player.scale.y = 0.5;
					player.y += 20;
					basket.y += 40;
				}
				else if (duck && !FlxG.keys.anyPressed(["DOWN"]))
				{
					//temp version
					duck = !duck;
					player.scale.y = 1;
					player.y -= 20;
					basket.y -= 40; 
				}
			
			}
			//Movement type of player
			else if (typeMove == 2)
			{
				
				if (FlxG.keys.anyPressed(["LEFT"])) 
				{
					this.velocity.x = -playerSpeed;
					
				}
				
				else if (FlxG.keys.anyPressed(["RIGHT"]))
				{
					this.velocity.x = playerSpeed;
				}
				
				else
				{
					this.velocity.x = 0;
				}
			}
			
			//For not lettintg it pass the edges
			if (basket.x < 0)
			{
				this.x = (basket.width - player.width) / 2;
			}
			
			else if (this.x > FlxG.stage.stageWidth + 20 - basket.width)
			{
				this.x = FlxG.stage.stageWidth - basket.width + ((basket.width - player.width) / 2);
			}
			
			
			timer -= FlxG.elapsed;
			
			if (timer <= 0)
			{
				timer = 0;
			}
		}
		else
		{
			player.y = this.y;
		}
		
		super.update(elapsed);
	}
	
	
}