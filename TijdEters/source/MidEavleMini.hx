package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class MidEavleMini extends FlxState
{
	public var player : Player;
	public var falling : FallingObjects;
	public var ui : UI;
	
	public static var dead : Bool = false;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		player = new Player(300, 400, 2, 50);
			add(player);
			add(player.player);
			add(Player.basket);
		
		var food = new FlxTypedGroup<Food>();
			add(food);	
			
		falling = new FallingObjects(0, 0, 2, food, 150);
			add(falling);
			
		ui = new UI(0, 0, "minigame");
			add(ui);
			add(ui.showScore);
			add(ui.showTime);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (Player.timer == 0 || dead)
		{
			FlxG.switchState(new MiniGameEnd());
		}
		
		super.update(elapsed);
	}
	
}