package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Florian
 */
class MainGame extends FlxState
{
	public static var dagDeel : String = "s'Ochtends";
	public static var taskList : Array<String> = new Array<String>();
	public static var buttonList : Array<FlxButton> = new Array<FlxButton>();
	public static var timeList : Array<Int> = new Array<Int>();
	public static var buttonTimeList : Array<FlxButton> = new Array<FlxButton>();
	public static var minute : Int = 30;
	public static var hour : Int = 7;
	var dropDownButton : FlxButton;
	var down : Bool;
	var ui : UI;	
	var clickedButton : Int;
	
	
	public function new() 
	{
		super();
		var filler : TaskListFiller = new TaskListFiller();
	}
	
	override public function create():Void 
	{
		super.create();
		
		ui = new UI(0, 0, "maingame");
		add(ui);
		add(ui.tempTime);
		
		dropDownButton = new FlxButton(50, 20, "Activiteiten", dropDown);
		dropDownButton.scale.x = 2;
		dropDownButton.scale.y = 2.5;
		add(dropDownButton);
		
		
		
		
		
	}
	
	public function dropDown()
	{
		if (!down)
		{
			for (i in 0...taskList.length)
			{
				var button : FlxButton = new FlxButton(50, i * 50 + 70, taskList[i], startActivity.bind(i));
				button.scale.x = 2;
				button.scale.y = 2.5;
				buttonList.push(button);
				add(button);
			}
			down = true;
		}
		else
		{
			for (i in 0...buttonList.length)
			{
				remove(buttonList[i]);
			}
			down = false;
		}
	}
	
	public function startActivity(task:Int)
	{
		clickedButton = task;
		
		/*taskList.remove(taskList[task]);
		remove(buttonList[task]);*/
		
		for (i in 0...timeList.length)
		{
			var button : FlxButton = new FlxButton(FlxG.stage.stageWidth / 2, i * 50 + 100, Std.string(timeList[i]), timeSet.bind(i));
				button.scale.x = 2;
				button.scale.y = 2.5;
				buttonTimeList.push(button);
				add(button);
		}
		/*for (i in 0...taskList.length)
		{
			for (j in 0...buttonList.length)
			{
				if (taskList[i] == button.text && buttonList[j].text == button.text)
				{
					taskList.remove(taskList[i]);
					remove(buttonList[j]);
				}
			}
		}*/
	}
	
	public function timeSet(time:Int)
	{
		down = true;
		taskList.remove(taskList[clickedButton]);
		remove(buttonList[clickedButton]);
		dropDown();
		
		minute += timeList[time];
		
		for (i in 0...buttonTimeList.length)
		{
			remove(buttonTimeList[i]);
		}
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		//internal time clock
		if (minute >= 60)
		{
			hour++;
			minute -= 60;
		}
		if (minute >= 120)
		{
			hour++;
			minute -= 120;
		}
		if (minute >= 180)
		{
			hour++;
			minute -= 180;
		}
		
		if (hour == 12)
		{
			if (dagDeel == "s'Ochtends")
			{
				dagDeel = "s'Middags";
			}
			else
			{
				dagDeel = "s'Ochtends";
			}
			hour = 0;
		}
		// don't touch the above
		
		
		super.update(elapsed);
	}
	
}