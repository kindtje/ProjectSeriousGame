package;

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
		
		player = new Player(300, 400, 1, tempTime);
			add(player);
			add(player.player);
			add(Player.basket);
		
		var food = new FlxTypedGroup<Food>();
			add(food);	
		
			
		falling = new FallingObjects(0, 0, 1, food, foodSpeed);
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
			FlxG.switchState(new MiniGameEnd());
		}
		
		
	}
	
}