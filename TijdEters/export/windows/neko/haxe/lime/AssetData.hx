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
			path.set ("assets/images/Background Medieval.png", "assets/images/Background Medieval.png");
			type.set ("assets/images/Background Medieval.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Background Roman.png", "assets/images/Background Roman.png");
			type.set ("assets/images/Background Roman.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/BackgroundBerries.png", "assets/images/BackgroundBerries.png");
			type.set ("assets/images/BackgroundBerries.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/basket.png", "assets/images/basket.png");
			type.set ("assets/images/basket.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bomb.png", "assets/images/bomb.png");
			type.set ("assets/images/bomb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/broccoli.png", "assets/images/broccoli.png");
			type.set ("assets/images/broccoli.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/chicken.png", "assets/images/chicken.png");
			type.set ("assets/images/chicken.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cow.png", "assets/images/cow.png");
			type.set ("assets/images/cow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hamburger.png", "assets/images/hamburger.png");
			type.set ("assets/images/hamburger.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/temp_berrie1.png", "assets/images/temp_berrie1.png");
			type.set ("assets/images/temp_berrie1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_berrie2.png", "assets/images/temp_berrie2.png");
			type.set ("assets/images/temp_berrie2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_berrie3.png", "assets/images/temp_berrie3.png");
			type.set ("assets/images/temp_berrie3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_berrie4.png", "assets/images/temp_berrie4.png");
			type.set ("assets/images/temp_berrie4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_bomb.png", "assets/images/temp_bomb.png");
			type.set ("assets/images/temp_bomb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_char.png", "assets/images/temp_char.png");
			type.set ("assets/images/temp_char.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_food.png", "assets/images/temp_food.png");
			type.set ("assets/images/temp_food.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/temp_mand.png", "assets/images/temp_mand.png");
			type.set ("assets/images/temp_mand.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/watermelon.png", "assets/images/watermelon.png");
			type.set ("assets/images/watermelon.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
