package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Florian
 */
class RomanMini extends FlxState
{
	public var spawnAnimals : SpawnAnimals;
	var arrow : FlxTypedGroup<Arrow>;
	var animals : FlxTypedGroup<Animal>;
	public var meatArray : Array<Meat>;
	var place : Int = 0;
	
	public function new() 
	{
		super();
		meatArray = new Array<Meat>();
		
	}
	
	override public function create():Void 
	{
		super.create(); 
		
		var bg:FlxSprite = new FlxSprite(0, -100);
        bg.loadGraphic("assets/images/Background_Roman.png");
		bg.scale.x = 1.1;
			add(bg);
		
		arrow = new FlxTypedGroup<Arrow>();
			add(arrow);
			
		var bow : Bow = new Bow(10, FlxG.stage.stageHeight / 2, arrow);
			add(bow);
		
		animals = new FlxTypedGroup<Animal>();
			add(animals);
			
		spawnAnimals = new SpawnAnimals(0, 0, animals);
			add(spawnAnimals);
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.overlap(animals, arrow, hit);
	}
	
	public function hit(animal : FlxObject, arrow : FlxSprite) 
	{
		if (animal.ID == 1)
		{
			arrow.destroy();
			Bow.shotAmount--;
			animal.health--;
			if (animal.health == 0)
			{
				var meat = new Meat(animal.x, animal.y, 1, getScore.bind(place));
				meat.scale.y = 0.1;
				meat.scale.x = 0.1;
				meat.updateHitbox();
				meatArray.push(meat);
					add(meat);
				place++;
				animal.destroy();
			}
		}
		else
		{
			arrow.destroy();
			Bow.shotAmount--;
			
			var wool = new Meat(animal.x, animal.y, 2, getScore.bind(place));
			wool.scale.x = 0.08;
			wool.scale.y = 0.08;
			wool.updateHitbox();
			meatArray.push(wool);
				add(wool);
			place++;
			animal.destroy();
		}
	}
	
	public function getScore(i : Int) 
	{
		if (meatArray[i].ID == 1)
		{
			meatArray[i].destroy();
		}
		else
		{
			meatArray[i].destroy();
		}
	}
	
}