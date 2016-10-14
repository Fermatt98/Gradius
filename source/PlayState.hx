package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxBasic;

class PlayState extends FlxState
{
	private var timer:Float = 0;
	private var yoqse:FlxSprite;
	private var yoqse2:FlxBasic;
	private var hud:Interfaz;
	
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level1__oel);
		Reg.tilemap = loader.loadTilemap(AssetPaths.tilesss__png);
		FlxG.worldBounds.set(0, 0, Reg.tilemap.width, Reg.tilemap.height);
		
		hud = new Interfaz();
		
		Reg.tilemap.setTileProperties(0, FlxObject.NONE);
		Reg.tilemap.setTileProperties(1, FlxObject.NONE);
		Reg.tilemap.setTileProperties(2, FlxObject.ANY);
		Reg.tilemap.setTileProperties(3, FlxObject.ANY);
		Reg.tilemap.setTileProperties(4, FlxObject.ANY);
		Reg.tilemap.setTileProperties(5, FlxObject.ANY);
		Reg.tilemap.setTileProperties(6, FlxObject.ANY, tile3Kill);
		Reg.tilemap.setTileProperties(7, FlxObject.ANY);
		Reg.tilemap.setTileProperties(8, FlxObject.ANY);
		Reg.tilemap.setTileProperties(9, FlxObject.ANY);
		Reg.tilemap.setTileProperties(10, FlxObject.ANY, tile3Kill);
		Reg.tilemap.setTileProperties(11, FlxObject.NONE);
		
		
		add(Reg.tilemap);
		Reg.scroll = new FlxSprite(FlxG.width/2, -50);
		Reg.scroll.velocity.x = Reg.velocityCamera;
		add(Reg.scroll);
		FlxG.camera.setScrollBounds(0, Reg.tilemap.width, 0, Reg.tilemap.height);
		FlxG.camera.follow(Reg.scroll);
		
		loader.loadEntities(placeEntities, "Objects");
		Reg.disparo = new CajaDisparo();
		add(hud);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.dead)
		{
			timer += elapsed;
			if (timer > 2)
			{
				if (Reg.playerVidas > 0)
				{
					Reg.playerVidas--;
					Reg.player.revive();
					timer = 0;
					Reg.dead = false;
				}
				else
				{
					trace("GAME OVER");
				}
			}
		}
		FlxG.collide(Reg.tilemap, Reg.player);
		if (FlxG.keys.justPressed.A)
		{
			yoqse2 = new CajaEnemigos1(FlxG.camera.scroll.x + FlxG.width, FlxG.height / 2);
		}
		if (FlxG.keys.justPressed.S)
		{
			yoqse = new Enemigo2(FlxG.camera.scroll.x + FlxG.width, FlxG.height / 2);
		}
		if (FlxG.keys.justPressed.D)
		{
			yoqse = new Enemigo3(FlxG.camera.scroll.x + FlxG.width, FlxG.height / 2);
		}
		if (FlxG.keys.justPressed.Q)
		{
			yoqse = new Boss(FlxG.camera.scroll.x + FlxG.width - 40, FlxG.height / 2);
		}
		if (FlxG.keys.justPressed.X)
		{
			Reg.escudo = new Escudo();
		}
		if (FlxG.keys.justPressed.Z)
		{
			Reg.velocityPlayer += Reg.speedUpVelocity;
			Reg.player.velocity.x = Reg.velocityPlayer;
			//misil
			Reg.misilOn = true;
		}
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			Reg.player = new Player(x, y);
			Reg.option = new Option(x, y);
		}
		if (entityName == "Enemigo1")
		{
			Reg.cajaEnemigos1 == new CajaEnemigos1 (x, y);
		}
		if (entityName == "Enemigo2")
		{
			Reg.enemigos2 == new Enemigo2 (x, y);
		}
		if (entityName == "Enemigo3")
		{
			Reg.enemigos3 == new Enemigo3 (x, y);
		}
		if (entityName == "Boss")
		{
			Reg.boss == new Boss (x, y);
		}
		if (entityName == "Mountain1")
		{
			Reg.mountain1 == new Mountain (x, y, 0);
		}
		if (entityName == "Mountain2")
		{
			Reg.mountain2 == new Mountain (x, y, 1);
		}
		if (entityName == "Mountain3")
		{
			Reg.mountain3 == new Mountain (x, y, 2);
		}
		if (entityName == "Mountain4")
		{
			Reg.mountain4 == new Mountain (x, y, 3);
		}
		
	}
	
	private function tile3Kill(a:FlxObject, b:FlxObject):Void
	{
		if (b == Reg.player)
		{
			Reg.player.kill();
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