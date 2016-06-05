package;
import flixel.FlxObject;

/**
 * ...
 * @author Florian
 */
class TaskListFiller extends FlxObject
{
	var lunch : Bool;
	public function new(start : Bool) 
	{
		super();
		if(start){
			MainGame.taskList.push("Ontbijten");
			MainGame.taskList.push("Huiswerk Maken");
			MainGame.taskList.push("Zelf Verzorging");
			MainGame.taskList.push("Spelen");
			MainGame.taskList.push("Opruimen");
			MainGame.taskList.push("Slapen");
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if ((TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour < 2) && !lunch)
		{
			for (i in 0...MainGame.taskList.length)
			{
				if (MainGame.taskList[i] == "Ontbijten")
				{
					MainGame.taskList.remove(MainGame.taskList[i]);
				}
			}
			MainGame.taskList.push("Lunchen");
			lunch = true;
		}
		
		if (TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour > 6 && TempDataStorage.hour < 8)
		{
			MainGame.taskList.push("Avond Eten");
		}
		
		if (TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour > 8)
		{
			MainGame.taskList.push("Slapen");
		}
		
		
	}
}