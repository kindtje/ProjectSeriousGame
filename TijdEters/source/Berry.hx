package;

import flixel.ui.FlxButton;

/**
 * ...
 * @author Florian
 */
class Berry extends FlxButton
{

	public var shrinkSpeed : Float = 0.0008;
	public var typeBerry : Int;
	public var graphicBerry : String;
	
	public function new(X:Float, Y:Float, ?OnClick:Void->Void, type : Int) 
	{
		super(X, Y, OnClick);
		
		
		typeBerry = type;
		this.loadGraphic("assets/images/berrie" + type+".png");
		this.scale.x = 0.2;
		this.scale.y = 0.2;
		this.updateHitbox();
		graphicBerry = "assets/images/berrie" + type+ ".png";
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		this.scale.x -= shrinkSpeed;
		this.scale.y -= shrinkSpeed;
		this.updateHitbox();
		
		if (this.scale.x < 0)
		{
			this.destroy();
		}
		
	}
}