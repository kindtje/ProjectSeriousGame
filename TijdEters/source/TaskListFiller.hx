package;
import flixel.FlxObject;

/**
 * ...
 * @author Florian
 */
class TaskListFiller extends FlxObject
{

	public function new() 
	{
		super();
		MainGame.taskList.push("Ontbijten");
		MainGame.taskList.push("Huiswerk Maken");
		MainGame.taskList.push("Zelf Verzorging");
		MainGame.taskList.push("Spelen");
		MainGame.taskList.push("Opruimen");
		
		MainGame.timeList.push(15);
		MainGame.timeList.push(30);
		MainGame.timeList.push(60);
		MainGame.timeList.push(120);
		MainGame.timeList.push(180);
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if ((MainGame.dagDeel == "s'Middags" && MainGame.hour < 2) || (MainGame.dagDeel == "s'Ochtends" && MainGame.hour > 9))
		{
			MainGame.taskList.push("Lunchen");
		}
		
		if (MainGame.dagDeel == "s'Middags" && MainGame.hour > 6 && MainGame.hour < 8)
		{
			MainGame.taskList.push("Avond Eten");
		}
		
		if (MainGame.dagDeel == "s'Middags" && MainGame.hour > 8)
		{
			MainGame.taskList.push("Slapen");
		}
		
		super.update(elapsed);
	}
}