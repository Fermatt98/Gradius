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
	private var scroll:FlxSprite;
	private var dead:Bool = false;
	private var timer:Float = 0;
	
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Demo__oel);
		Reg.tilemap = loader.loadTilemap(AssetPaths.Tiles__png);
		FlxG.worldBounds.set(0, 0, Reg.tilemap.width, Reg.tilemap.height);
		
		
		Reg.tilemap.setTileProperties(0, FlxObject.NONE);
		Reg.tilemap.setTileProperties(1, FlxObject.NONE);
		Reg.tilemap.setTileProperties(2, FlxObject.ANY, tile2Kill);
		Reg.tilemap.setTileProperties(3, FlxObject.ANY, tile3Kill);
		
		add(Reg.tilemap);
		scroll = new FlxSprite();
		scroll.velocity.x = Reg.velocityCamera;
		add(scroll);
		FlxG.camera.setScrollBounds(0, Reg.tilemap.width, 0, Reg.tilemap.height);
		FlxG.camera.follow(scroll);
		
		loader.loadEntities(placeEntities, "Objects");
		Reg.disparo = new CajaDisparo();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (dead)
		{
			timer += elapsed;
			if (timer > 2)
			{
				if (Reg.playerVidas > 0)
				{
					Reg.playerVidas--;
					Reg.player.revive();
					timer = 0;
					dead = false;
				}
				else
				{
					trace("GAME OVER");
				}
			}
		}
		FlxG.collide(Reg.tilemap, Reg.player);
		
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			Reg.player = new Player(x, y);
		}
	}
	
	private function tile3Kill(a:FlxObject, b:FlxObject):Void
	{
		if (b == Reg.player)
		{
			Reg.player.kill();
			dead = true;
		}
		else for (i in 0...Reg.disparoArray.length) 
		{
			if (b == Reg.disparoArray[i])
			{
				Reg.disparoArray[i].kill();
				Reg.DisparosVivos -= 1; 
			}
		}
	}
	private function tile2Kill(a:FlxObject, b:FlxObject):Void
	{
		for (i in 0...Reg.disparoArray.length) 
		{
			if (b == Reg.disparoArray[i])
			{
				Reg.disparoArray[i].kill();
				Reg.DisparosVivos -= 1; 
			}
		}
	}
}