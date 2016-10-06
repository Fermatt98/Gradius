package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;

class PlayState extends FlxState
{
	private var player:FlxSprite;
	private var scroll:FlxSprite;
	private var tilemap:FlxTilemap;
	
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Demo__oel);
		tilemap = loader.loadTilemap(AssetPaths.Tiles__png);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(2, FlxObject.ANY);
		
		
		add(tilemap);
		scroll = new FlxSprite();
		scroll.velocity.x = 50;
		add(scroll);
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.camera.follow(scroll);
		
		loader.loadEntities(placeEntities, "Objects");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(tilemap, player);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		trace(y);
		if (entityName == "player")
		{
			player = new Player(x, y);
		}
	}
}