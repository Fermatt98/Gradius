package;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Reg
{	
	

	

	inline static public var speedUpVelocity = 25;
	inline static public var misilVelocity:Int = 150;
	inline static public var maxSpeedUp:Int = 5;
	inline static public var defaultVelocityPlayer:Int = 100;
	inline static public var velocityCamera:Int = 50;
	inline static public var controlCaja:Float = 0.2;
	inline static public var velocityBala:Int = 300;
	inline static public var velocityEnemy1:Int = 100;
	inline static public var velocityEnemy2:Int = 25;
	inline static public var velocityEnemy3:Int = 25;
	inline static public var accelerationEnemy3:Int = 10;
	inline static public var cantEnemigos1:Int = 4;	
	inline static public var scoreEnemigo1:Int = 250;
	inline static public var scoreEnemigo2:Int = 500;
	inline static public var scoreEnemigo3:Int = 1000;
	inline static public var scoreBoss:Int = 10000;
	
	static public var velocityPlayer:Int = defaultVelocityPlayer;
	static public var speedUpOn:Bool = false;
	static public var misilOn:Bool = false;
	static public var escudoOn:Bool = false;	
	static public var optionOn:Bool = false;
	static public var misilVivo:Bool = false;
	static public var misil:Misil;
	static public var misil2:Misil;
	static public var misil3:Misil;
	static public var speedUpPower:Int = 0;	
	static public var score:Int = 0;
	static public var highScore:Int = 10000;
	static public var escudo:Escudo;
	static public var player:FlxSprite;
	static public var disparo:CajaDisparo;
	static public var DisparosVivos:Int = 0;
	static public var tilemap:FlxTilemap;
	static public var disparoArray:Array<FlxSprite>;
	static public var disparoBoss:FlxSprite;
	static public var playerVidas:Int = 3;
	static public var cajaEnemigos1:FlxBasic;
	static public var enemigos2:FlxSprite;
	static public var enemigos3:FlxSprite;
	static public var boss:FlxSprite;
	static public var cajaBoss:FlxBasic;
	static public var scroll:FlxSprite;
	static public var option:FlxSprite;
	static public var option2:FlxSprite;
	static public var movementBool:Bool = false;
	static public var movementBool2:Bool = false;
	static public var dead:Bool = false;
	static public var mountain1:FlxSprite;
	static public var mountain2:FlxSprite;
	static public var mountain3:FlxSprite;
	static public var mountain4:FlxSprite;
	static public var VidasBoss:Int = 30;
	static public var ejeX:Float;
	static public var ejeY:Float;
	static public var powerUp:Int = 0;
}