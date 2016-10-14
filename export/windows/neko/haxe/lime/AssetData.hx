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
			path.set ("assets/data/Demo.oel", "assets/data/Demo.oel");
			type.set ("assets/data/Demo.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Demo.oep", "assets/data/Demo.oep");
			type.set ("assets/data/Demo.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level1.oel", "assets/data/Level1.oel");
			type.set ("assets/data/Level1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/mountain_0.png", "assets/images/mountain_0.png");
			type.set ("assets/images/mountain_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mountain_1.png", "assets/images/mountain_1.png");
			type.set ("assets/images/mountain_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mountain_2.png", "assets/images/mountain_2.png");
			type.set ("assets/images/mountain_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mountain_3.png", "assets/images/mountain_3.png");
			type.set ("assets/images/mountain_3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tiles.png", "assets/images/Tiles.png");
			type.set ("assets/images/Tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tiles2.png", "assets/images/Tiles2.png");
			type.set ("assets/images/Tiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilesss.png", "assets/images/tilesss.png");
			type.set ("assets/images/tilesss.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
