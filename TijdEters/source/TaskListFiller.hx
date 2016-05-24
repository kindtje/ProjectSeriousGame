package;
import flixel.FlxObject;

/**
 * ...
 * @author Florian
 */
class TaskListFiller extends FlxObject
{

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
			
			MainGame.timeList.push(15);
			MainGame.timeList.push(30);
			MainGame.timeList.push(60);
			MainGame.timeList.push(120);
			MainGame.timeList.push(180);
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if ((TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour < 2) || (TempDataStorage.dagDeel == "s'Ochtends" && TempDataStorage.hour > 9))
		{
			for (i in 0...MainGame.taskList.length)
			{
				if (MainGame.taskList[i] == "ontbijten")
				{
					MainGame.taskList.remove(MainGame.taskList[i]);
				}
			}
			MainGame.taskList.push("Lunchen");
		}
		
		if (TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour > 6 && TempDataStorage.hour < 8)
		{
			MainGame.taskList.push("Avond Eten");
		}
		
		if (TempDataStorage.dagDeel == "s'Middags" && TempDataStorage.hour > 8)
		{
			MainGame.taskList.push("Slapen");
		}
		
		super.update(elapsed);
	}
}