package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;



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
	public var pathMaker : Array<FlxPoint> = new Array<FlxPoint>();

	var dropDownButton : FlxButton;
	var down : Bool;
	var ui : UI;	
	var clickedButton : Int;
	var player : Player;
	var updateFiller : TaskListFiller = new TaskListFiller(false);
	public var getTime : Int;
	var tween:FlxTween;


	
	var spot0 = new FlxPoint( -200, 50);
	var spot1 = new FlxPoint(100, 50);
	var spot2 = new FlxPoint(400, 50);
	var spot3 = new FlxPoint(700, 50);
	var spot4 = new FlxPoint(1000, 50);
	var spot5 = new FlxPoint(1000, 250);
	var spot6 = new FlxPoint(1000, 450);
	var spot7 = new FlxPoint(600, 120);
	var spot8 = new FlxPoint(800, 120);
	var spot9 = new FlxPoint(700, 200);
	var spot10 = new FlxPoint(150, 275);
	var spot11 = new FlxPoint(200, 500);
	var spot12 = new FlxPoint(400, 500);	
	var spot13 = new FlxPoint(100, 500);


	

	
	
	
	
	
	public function new(newStart : Bool) 
	{
		super();
		var filler : TaskListFiller = new TaskListFiller(newStart);
		
		
	}
	
	override public function create():Void 
	{
		super.create();
		
		var bg:FlxSprite = new FlxSprite(0, -100);
        bg.loadGraphic("assets/images/MainBackground.png");
		bg.scale.x = 1.02;
		bg.scale.y = 0.8;
			add(bg);
		
		
		player = new Player(100, 50, 3, null);
			add(player);
			add(player.player);
			player.ID = 1;
		
		
		ui = new UI(0, 0, "maingame");
			add(ui);
			add(ui.maxSleep);
			add(ui.maxHunger);
			add(ui.sleep);
			add(ui.hunger);
			add(ui._hunger);
			add(ui._sleep);
	
		//tijdelijke klok
			add(ui.tempTime);
		
		dropDownButton = new FlxButton(50, 20, "Activiteiten", dropDown);
		dropDownButton.scale.x = 2;
		dropDownButton.scale.y = 2.5;
			add(dropDownButton);
		
		FlxG.sound.playMusic("assets/music/menuMusic.wav", 1, true);
		
		
		
		
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
		setTimeArray(task);
		for (i in 0...timeList.length)
		{
			var button : FlxButton = new FlxButton(FlxG.stage.stageWidth / 2, i * 50 + 100, Std.string(timeList[i]), timeSet.bind(i));
				button.scale.x = 2;
				button.scale.y = 2.5;
				buttonTimeList.push(button);
				add(button);
		}
	}
	
	/**
	 * empty's timelist array and refills it according to activity
	 * @param	task
	 */
	public function setTimeArray(task:Int)
	{
		for (i in 0...timeList.length)
		{
			timeList.pop();
		}
		
		for (i in 0...buttonTimeList.length)
		{
			buttonTimeList.pop().destroy();
		}
		
		switch(taskList[task])
		{
			case "Ontbijten":
				timeList.push(15);
				timeList.push(30);
				timeList.push(45);
				
				
			case "Lunchen":
				timeList.push(15);
				timeList.push(30);
				timeList.push(45);
				
			case "Avond Eten":
				timeList.push(15);
				timeList.push(30);
				timeList.push(45);
				
			case "Huiswerk Maken":
				timeList.push(60);
				timeList.push(120);
				timeList.push(180);
				
			case "Spelen":
				timeList.push(30);
				timeList.push(60);
				timeList.push(120);
				
			case "Zelf Verzorging":
				timeList.push(5);
				timeList.push(15);
				timeList.push(30);
				
			case "Opruimen":
				timeList.push(15);
				timeList.push(30);
				timeList.push(60);
				
			case "Slapen":
				timeList.push(30);
				timeList.push(60);
				timeList.push(120);
				timeList.push(180);
				timeList.push(240);
				timeList.push(300);
				
			
		}
	}
	
	public function timeSet(time:Int)
	{
		down = true;
		getTime = time;
		
		if (taskList[clickedButton] == "Ontbijten" || taskList[clickedButton] == "Lunchen" || taskList[clickedButton] == "Avond Eten")
		{
			walk(6);
			changeHungerAndSleep(time, true);
		}
		else if (taskList[clickedButton] == "Slapen")
		{
			walk(12);
			changeHungerAndSleep(time, false);
		}
		else if (taskList[clickedButton] == "Spelen")
		{
			walk(0);
			changeHungerAndSleep(time, false);
		}
		else
		{
			changeHungerAndSleep(time, false);
			walk(9);
		}
		
		
		dropDown();
		
		TempDataStorage.minute += timeList[time];
		
		
		for (i in 0...buttonTimeList.length)
		{
			remove(buttonTimeList[i]);
		}
		
	}
	
	public function walk( walkTo : Int)
	{
		if (player.ID != walkTo)
		{
			if (player.ID == 1 && walkTo == 0)
			{
				pathMaker.push(spot0);
				player.ID = walkTo;
			}
			
			else if (player.ID <= 1 && (walkTo == 6 || walkTo == 9 || walkTo == 12 || walkTo == 13))
			{
				switch(walkTo)
				{
					case 6:
						pathMaker.push(spot6);
						pathMaker.push(spot5);
						pathMaker.push(spot4);
						pathMaker.push(spot3);
						pathMaker.push(spot2);
						
					case 9:	
						pathMaker.push(spot9);
						pathMaker.push(spot7);
					
					case 12:
						pathMaker.push(spot12);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
						
					case 13:
						pathMaker.push(spot13);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
				
				}
				
				if (player.ID == 0)
					pathMaker.push(spot1);
					
					
				player.ID = walkTo;
			}
			
			else if (player.ID == 6)
			{

				switch(walkTo)
				{
					case 0:
						pathMaker.push(spot0);
						pathMaker.push(spot1);
						pathMaker.push(spot2);
						pathMaker.push(spot3);
					case 9: 
						pathMaker.push(spot9);
						pathMaker.push(spot8);
						
					case 12:
						pathMaker.push(spot12);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
						pathMaker.push(spot1);
						pathMaker.push(spot2);	
						pathMaker.push(spot3);
						
					case 13:
						pathMaker.push(spot13);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
						pathMaker.push(spot1);
						pathMaker.push(spot2);
						pathMaker.push(spot3);
						
				}
				
				
				pathMaker.push(spot4);
				pathMaker.push(spot5);
				
				player.ID = walkTo;
			}
			else if ((player.ID == 13 || player.ID == 12) && walkTo < 10)
			{
				
				switch(walkTo)
				{
					case 0:
						pathMaker.push(spot0);
					
					case 6:
						pathMaker.push(spot6); 
						pathMaker.push(spot5);
						pathMaker.push(spot4);
						pathMaker.push(spot3);
						pathMaker.push(spot2);
						
					case 9:
						pathMaker.push(spot9);
						pathMaker.push(spot7);
				}
				
				pathMaker.push(spot1);
				pathMaker.push(spot10);
				pathMaker.push(spot11);
				
				player.ID = walkTo;
				
			}
			else if ((player.ID == 13 && walkTo == 12) || (player.ID == 12 && walkTo == 13))
			{
				switch(player.ID)
				{
					case 13:
						pathMaker.push(spot12);
						pathMaker.push(spot11);
					
					case 12:
						pathMaker.push(spot13);
						pathMaker.push(spot11);
				}
				
				player.ID = walkTo;
			}
			else if (player.ID == 9 && ((walkTo >= 3 && walkTo <= 6) || (walkTo > 10 || walkTo == 0)))
			{
				switch(walkTo)
				{
					case 0:
						pathMaker.push(spot0);
						pathMaker.push(spot1);
						pathMaker.push(spot7);
						
					case 6:
						pathMaker.push(spot6);
						pathMaker.push(spot5);
						pathMaker.push(spot4);
						pathMaker.push(spot8);
						
					case 12:
						pathMaker.push(spot12);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
						pathMaker.push(spot1);
						pathMaker.push(spot7);
						
					case 13:
						pathMaker.push(spot13);
						pathMaker.push(spot11);
						pathMaker.push(spot10);
						pathMaker.push(spot1);
						pathMaker.push(spot7);
				}
				
				player.ID = walkTo;
				
			}
			trace(player.ID +" , "+ walkTo+" , "+pathMaker.length);
		}
		
		if (player.ID == walkTo)
		{
			var spot = pathMaker.pop();
			
			if (spot.y > player.y)
				FlxTween.angle(player.player, player.player.angle, 180, 0.3);
			else if (spot.y < player.y)
				FlxTween.angle(player.player, player.player.angle, 0, 0.3);
			else if (spot.x > player.x)
				FlxTween.angle(player.player, player.player.angle, 90, 0.3);
			else if (spot.x < player.x)
				FlxTween.angle(player.player, player.player.angle, 270, 0.3);
				
			FlxTween.tween(player, {x: spot.x, y: spot.y}, 1.5, {onComplete: doNext});
		}
	}
	
	function doNext(tween:FlxTween):Void 
	{
		if (pathMaker.length > 0)
		{
			var spot = pathMaker.pop();
			
			if (spot.y > player.y)
				FlxTween.angle(player.player, player.player.angle, 180, 0.3);
			else if (spot.y < player.y)
				FlxTween.angle(player.player, player.player.angle, 0, 0.3);
			else if (spot.x > player.x)
				FlxTween.angle(player.player, player.player.angle, 90, 0.3);
			else if (spot.x < player.x)
				FlxTween.angle(player.player, player.player.angle, -90, 0.3);
				
				
			FlxTween.tween(player, {x: spot.x, y: spot.y}, 1.5, {onComplete: doNext});
		}
		else
		{
			startMini();
		}
	}

	private function startMini()
	{
			if (taskList[clickedButton] == "Ontbijten" || taskList[clickedButton] == "Lunchen" || taskList[clickedButton] == "Avond Eten")
			{
				changeHungerAndSleep(getTime, true);
				startEatingMini(timeList[getTime]);
			}
			else if (taskList[clickedButton] == "Slapen")
			{
				changeHungerAndSleep(getTime, false);
				startSleepingMini();
			}
			else if (taskList[clickedButton] == "Spelen")
			{
				changeHungerAndSleep(getTime, false);
				startPlayMini();
			}
			taskList.remove(taskList[clickedButton]);
			remove(buttonList[clickedButton]);
		
	}
	
	public function changeHungerAndSleep(time : Int, eat:Bool)
	{
		var sleepSet = timeList[time] / 60 * 2;
		UI.sleepInt += sleepSet;
		
		if (!eat)
		{
			UI.hungerInt += timeList[time] / 60 * 10;
		}
		
	}
	
	public function startPlayMini() 
	{
		FlxG.sound.destroy(true);
		FlxG.switchState(new StoneAgeMini());
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
				FlxG.switchState(new RomanMini());
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
		
		updateFiller.update(elapsed);
		
		
	}
	
}