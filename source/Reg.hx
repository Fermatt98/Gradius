package;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author ...
 */
class Reg
{
	inline static public var velocityPlayer:Int = 100;
	inline static public var velocityCamera:Int = 50;
	inline static public var controlCaja:Float = 0.2;
	inline static public var velocityBala:Int = 300;
	static public var player:FlxSprite;
	static public var disparo:CajaDisparo;
	static public var DisparosVivos:Int = 0;
	static public var tilemap:FlxTilemap;
	static public var disparoArray:Array<FlxSprite>;
	static public var playerVidas:Int = 3;
}