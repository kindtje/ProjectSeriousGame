package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Florian
 */
class Food extends FlxSprite
{
	
	public var foodObject : FlxSprite;
	var typeObject : Int;
	var typeGame : Int;
	
	public function new(X:Float, Y:Float, foodType : Int, gameType:Int, speed : Int) 
	{
		super(X, Y);
		
		this.velocity.y = speed;
		
		typeObject = foodType;
		typeGame = gameType;
		
		switch (foodType)
		{
			case 1:
				
				this.loadGraphic("assets/images/temp_food.png");
				this.solid = true;
				this.updateHitbox();
				
			case 2:
				this.loadGraphic("assets/images/temp_bomb.png");
				this.solid = true;
				this.updateHitbox();
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		switch(typeObject) 
		{
			case 1:
				FlxG.overlap(this, Player.basket, goodCol);
			
			case 2:
				FlxG.overlap(this, Player.basket, badCol);
				
				if (this.y > FlxG.stage.stageHeight && !Player.duck && typeGame == 1)
				{
					Player.score--;
					this.destroy();
				}

		}
		
		if (this.y > FlxG.stage.stageHeight)
			{
				this.destroy();
			}
			
		super.update(elapsed);
	}
	
	public function badCol(food : FlxObject, player:FlxObject) 
	{
		Player.timer -= 5.0;
		this.destroy();
	}
	
	public function goodCol(food : FlxObject, player:FlxObject) 
	{
		Player.score++;
		this.destroy();
	}
	
}