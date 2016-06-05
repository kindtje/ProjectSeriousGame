package;

import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class MainMiniState extends FlxState
{
	public var player : Player;
	public var falling : FallingObjects;
	public var ui : UI;
	var tempTime: Int;
	var foodSpeed : Int;
	
	
	public function new(time : Int) 
	{
		super();
		tempTime = time;
		if (tempTime <= 30)
		{
			foodSpeed = 300;
		}
		else if (tempTime == 60)
		{
			foodSpeed = 200;
		}
		else
		{
			foodSpeed = 150;
		}
		
	}
	
	override public function create():Void 
	{
		super.create();
		
		var bg:FlxSprite = new FlxSprite(0, -100);
        bg.loadGraphic("assets/images/ModernBackground.png");
		bg.scale.x = 1.1;
			add(bg);
			
			
		player = new Player(300, FlxG.stage.stageHeight, 1, tempTime);
			add(player);
			add(player.player);
			add(Player.basket);
		
		var food = new FlxTypedGroup<Food>();
			add(food);
		
		var explosion = new FlxTypedGroup<FlxEmitter>();
			add(explosion);
		
			
		falling = new FallingObjects(0, 0, 1, food, foodSpeed, explosion);
			add(falling);
			
		ui = new UI(0, 0, "minigame");
			add(ui);
			add(ui.showScore);
			add(ui.showTime);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (Player.timer == 0)
		{
			FlxG.switchState(new MiniGameEnd(Player.score));
		}
		
		
	}
	
}