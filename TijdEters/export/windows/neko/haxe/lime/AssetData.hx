package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/apple.png", "assets/images/apple.png");
			type.set ("assets/images/apple.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background Berries.png", "assets/images/Background Berries.png");
			type.set ("assets/images/Background Berries.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background Medieval.png", "assets/images/Background Medieval.png");
			type.set ("assets/images/Background Medieval.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background Roman.png", "assets/images/Background Roman.png");
			type.set ("assets/images/Background Roman.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background_Medieval.png", "assets/images/Background_Medieval.png");
			type.set ("assets/images/Background_Medieval.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background_Roman.png", "assets/images/Background_Roman.png");
			type.set ("assets/images/Background_Roman.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/basket.png", "assets/images/basket.png");
			type.set ("assets/images/basket.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berrie1.png", "assets/images/berrie1.png");
			type.set ("assets/images/berrie1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berrie2.png", "assets/images/berrie2.png");
			type.set ("assets/images/berrie2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berrie3.png", "assets/images/berrie3.png");
			type.set ("assets/images/berrie3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berrie4.png", "assets/images/berrie4.png");
			type.set ("assets/images/berrie4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berrie5.png", "assets/images/berrie5.png");
			type.set ("assets/images/berrie5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bomb.png", "assets/images/bomb.png");
			type.set ("assets/images/bomb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/broccoli.png", "assets/images/broccoli.png");
			type.set ("assets/images/broccoli.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/chicken.png", "assets/images/chicken.png");
			type.set ("assets/images/chicken.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cow.png", "assets/images/cow.png");
			type.set ("assets/images/cow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/explosion.jpg", "assets/images/explosion.jpg");
			type.set ("assets/images/explosion.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/explosion.png", "assets/images/explosion.png");
			type.set ("assets/images/explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hamburger.png", "assets/images/hamburger.png");
			type.set ("assets/images/hamburger.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hand cursor.png", "assets/images/hand cursor.png");
			type.set ("assets/images/hand cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/MainBackground.png", "assets/images/MainBackground.png");
			type.set ("assets/images/MainBackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/meat .png", "assets/images/meat .png");
			type.set ("assets/images/meat .png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ModernBackground.png", "assets/images/ModernBackground.png");
			type.set ("assets/images/ModernBackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/playerTopDown.png", "assets/images/playerTopDown.png");
			type.set ("assets/images/playerTopDown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_arrow.png", "assets/images/temp_arrow.png");
			type.set ("assets/images/temp_arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_bow.png", "assets/images/temp_bow.png");
			type.set ("assets/images/temp_bow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_char.png", "assets/images/temp_char.png");
			type.set ("assets/images/temp_char.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_hand.png", "assets/images/temp_hand.png");
			type.set ("assets/images/temp_hand.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_sheep.png", "assets/images/temp_sheep.png");
			type.set ("assets/images/temp_sheep.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_wolf.png", "assets/images/temp_wolf.png");
			type.set ("assets/images/temp_wolf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/watermelon.png", "assets/images/watermelon.png");
			type.set ("assets/images/watermelon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/white berry.png", "assets/images/white berry.png");
			type.set ("assets/images/white berry.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/wool.png", "assets/images/wool.png");
			type.set ("assets/images/wool.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/menuMusic.mp3", "assets/music/menuMusic.mp3");
			type.set ("assets/music/menuMusic.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/menuMusic.wav", "assets/music/menuMusic.wav");
			type.set ("assets/music/menuMusic.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
