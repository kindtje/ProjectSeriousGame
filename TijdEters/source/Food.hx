package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.effects.particles.FlxEmitter;
import flixel.util.FlxColor;

/**
 * ...
 * @author Florian
 */
class Food extends FlxSprite
{
	var explosionGroup :FlxTypedGroup<FlxEmitter>;
	public var foodObject : FlxSprite;
	var typeObject : Int;
	var typeGame : Int;
	public var explosion : FlxEmitter;
	
	public function new(X:Float, Y:Float, foodType : Int, gameType:Int, speed : Int, _explosion :FlxTypedGroup<FlxEmitter>) 
	{
		super(X, Y);
		if (!null)
		{
			explosionGroup = _explosion;
		}
		this.velocity.y = speed;
		typeObject = foodType;
		typeGame = gameType;
		
		foodObject = new FlxSprite(-1000, -1000);
		
		switch (gameType)
		{
			case 1:
				switch (foodType)
				{
					case 1:
						var randomFood : Int = Std.random(4) + 1;
						
						switch(randomFood)
						{
							case 1:
								this.loadGraphic("assets/images/apple.png");
								this.scale.x = 0.1;
								this.scale.y = 0.1;
								this.solid = true;
								this.updateHitbox();
							
							case 2:
								this.loadGraphic("assets/images/watermelon.png");
								this.scale.x = 0.15;
								this.scale.y = 0.15;
								this.solid = true;
								this.updateHitbox();
								
							case 3:
								this.loadGraphic("assets/images/broccoli.png");
								this.scale.x = 0.08;
								this.scale.y = 0.08;
								this.solid = true;
								this.updateHitbox();
								
							case 4:
								this.loadGraphic("assets/images/hamburger.png");
								this.scale.x = 0.15;
								this.scale.y = 0.15;
								this.solid = true;
								this.updateHitbox();
						
						}
						
						
					case 2:
						this.loadGraphic("assets/images/bomb.png");
						this.scale.x = 0.1;
						this.scale.y = 0.1;
						this.solid = true;
						this.updateHitbox();
						
				}
				
				
			case 2:
				switch (foodType)
				{
					case 1:
						
						this.loadGraphic("assets/images/chicken.png");
						this.scale.x = 0.1;
						this.scale.y = 0.1;
						this.solid = true;
						this.updateHitbox();
						
						
					case 2:
						this.loadGraphic("assets/images/cow.png");
						this.scale.x = 0.2;
						this.scale.y = 0.2;
						this.solid = true;
						this.updateHitbox();
						
				}
		}
		
		explosion = new FlxEmitter();
		explosion.makeParticles(20, 20, FlxColor.RED, 20);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		switch(typeObject) 
		{
			case 1:
				FlxG.overlap(this, Player.basket, goodCol);
			
			case 2:
				FlxG.overlap(this, Player.basket, badCol);
				
				if (this.y > FlxG.stage.stageHeight)
				{
					if (!Player.duck && typeGame == 1)
					{
						Player.score--;
					}
					explosion.x = this.x;
					explosion.y = FlxG.stage.stageHeight;
					explosion.start(true);
					explosion.update(elapsed);
					explosionGroup.add(explosion);
					this.destroy();
				}

		}
		
		if (this.y > FlxG.stage.stageHeight)
			{
				this.destroy();
			}
			
		
	}
	
	public function badCol(food : FlxObject, player:FlxObject) 
	{
		if (typeGame == 1)
		{
			Player.timer -= 5.0;
			this.destroy();
		}
		else
		{
			MidEavleMini.dead = true;
		}
	}
	
	public function goodCol(food : FlxObject, player:FlxObject) 
	{
		if (food.y < player.y)
		{
			Player.score++;
			UI.hungerInt -= 1;
			this.destroy();
			
		}
	}
	
}