package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import openfl.display.Bitmap;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Florian
 */
class MainGame extends FlxState
{
	
	public static var taskList : Array<String> = new Array<String>();
	public static var buttonList : Array<FlxButton> = new Array<FlxButton>();
	public static var timeList : Array<Int> = new Array<Int>();
	public static var buttonTimeList : Array<FlxButton> = new Array<FlxButton>();

	var dropDownButton : FlxButton;
	var down : Bool;
	var ui : UI;	
	var clickedButton : Int;

	
	
	public function new(newStart : Bool) 
	{
		super();
		var filler : TaskListFiller = new TaskListFiller(newStart);
	}
	
	override public function create():Void 
	{
		super.create();
		
		ui = new UI(0, 0, "maingame");
		add(ui);
		/*add(ui.maxSleep);
		add(ui.maxHunger);
		add(ui.sleep);
		add(ui.hunger);
		add(ui._hunger);
		add(ui._sleep);*/
	
		//tijdelijke klok
		add(ui.tempTime);
		
		dropDownButton = new FlxButton(50, 20, "Activiteiten", dropDown);
		dropDownButton.scale.x = 2;
		dropDownButton.scale.y = 2.5;
		add(dropDownButton);
		
		FlxG.sound.playMusic("assets/music/menuMusic.mp3", 1, true);
		
		
		
		
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
		
		for (i in 0...timeList.length)
		{
			var button : FlxButton = new FlxButton(FlxG.stage.stageWidth / 2, i * 50 + 100, Std.string(timeList[i]), timeSet.bind(i));
				button.scale.x = 2;
				button.scale.y = 2.5;
				buttonTimeList.push(button);
				add(button);
		}
	}
	
	public function timeSet(time:Int)
	{
		down = true;
		if (taskList[clickedButton] == "Ontbijten" || taskList[clickedButton] == "Lunchen" || taskList[clickedButton] == "Avond Eten")
		{
			startEatingMini(timeList[time]);
		}
		else if (taskList[clickedButton] == "Slapen")
		{
			startSleepingMini();
		}
		taskList.remove(taskList[clickedButton]);
		remove(buttonList[clickedButton]);
		dropDown();
		
		TempDataStorage.minute += timeList[time];
		
		for (i in 0...buttonTimeList.length)
		{
			remove(buttonTimeList[i]);
		}
		
	}
	
	public function startSleepingMini() 
	{
		var i : Int = Std.random(2);
		
		switch(i)
		{
			case 0:
				FlxG.sound.destroy(true);
				FlxG.switchState(new MidEavleMini());
			case 1:
				FlxG.switchState(new StoneAgeMini());
			case 2:
				FlxG.switchState(new MenuState());
		}
	}
	
	public function startEatingMini(time : Int) 
	{
		FlxG.sound.destroy(true);
		FlxG.switchState(new MainMiniState(time));
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		//internal time clock
		if (TempDataStorage.minute >= 60)
		{
			TempDataStorage.hour++;
			TempDataStorage.minute -= 60;
		}
		if (TempDataStorage.minute >= 120)
		{
			TempDataStorage.hour++;
			TempDataStorage.minute -= 120;
		}
		if (TempDataStorage.minute >= 180)
		{
			TempDataStorage.hour++;
			TempDataStorage.minute -= 180;
		}
		
		if (TempDataStorage.hour == 13)
		{
			if (TempDataStorage.dagDeel == "s'Ochtends")
			{
				TempDataStorage.dagDeel = "s'Middags";
			}
			else
			{
				TempDataStorage.dagDeel = "s'Ochtends";
			}
			TempDataStorage.hour = 1;
		}
		// don't touch the above
		var updateFiller : TaskListFiller = new TaskListFiller(false);
		
		
	}
	
}