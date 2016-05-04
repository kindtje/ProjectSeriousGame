package;

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
	
	public function new() 
	{
		super();
		
	}
	
	override public function create():Void 
	{
		super.create();
		
		player = new Player(300, 400, 1);
			add(player);
			add(player.player);
			add(Player.basket);
		
		var food = new FlxTypedGroup<Food>();
			add(food);	
			
		falling = new FallingObjects(0, 0, 1, food);
			add(falling);
			
		ui = new UI(0, 0);
			add(ui);
			add(ui.showScore);
			add(ui.showTime);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}