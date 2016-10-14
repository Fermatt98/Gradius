package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Enemigo3 extends FlxSprite
{
	private var movement:Bool = false;
	private var maxAcceleration:Int = 200;
	private var wasOnScreen:Bool = false;
	private var random:FlxRandom;
	private var justDead:Bool;
	private var deadSound:FlxSound;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		justDead = true;
		loadGraphic(AssetPaths.Enemigo3__png);
		deadSound = FlxG.sound.load(AssetPaths.ExplosionEnemigos__wav);
		random = new FlxRandom();
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			wasOnScreen = true;
			if (velocity.y > maxAcceleration || velocity.y < -maxAcceleration)
			{
				if (movement)
				{
					movement = false;
				}
				else
				{
					movement = true;
				}
			}
			if (movement)
			{
				velocity.y += Reg.accelerationEnemy3;
			}
			else
			{
				velocity.y -= Reg.accelerationEnemy3;
			}
			velocity.x = Reg.velocityEnemy3 *-1;
			for (i in 0...Reg.disparoArray.length)
			{
				if (FlxG.overlap(this, Reg.disparoArray[i]))
				{
					Reg.score += Reg.scoreEnemigo3;
					kill();
					Reg.disparoArray[i].kill();
					if (random.int(0, 10) == 9)
					{
						var n:FlxSprite = new PowerUp(x, y);
					}
				}
			}
			if (FlxG.overlap(this, Reg.misil))
			{
				Reg.score += Reg.scoreEnemigo3;
				kill();
				Reg.misil.kill();
				Reg.misilVivo = false;
				if (random.int(0, 10) == 9)
				{
					var n:FlxSprite = new PowerUp(x, y);
				}
			}
			if (FlxG.overlap(this, Reg.misil2))
			{
				Reg.score += Reg.scoreEnemigo3;
				kill();
				Reg.misil2.kill();
				if (random.int(0, 10) == 9)
				{
					var n:FlxSprite = new PowerUp(x, y);
				}
			}
			if (FlxG.overlap(this, Reg.misil3))
			{
				Reg.score += Reg.scoreEnemigo3;
				kill();
				Reg.misil3.kill();
				if (random.int(0, 5) == 4)
				{
					var n:FlxSprite = new PowerUp(x, y);
				}
			}
			if (FlxG.overlap(this, Reg.escudo))
			{
				kill();
				Reg.escudo.qVida(1);
			}
			else if (FlxG.overlap(this, Reg.player))
			{
				Reg.player.kill();
			}
		}
		else if (wasOnScreen)
		{
			justDead = false;
			kill();
		}
	}
	override public function kill():Void 
	{
		super.kill();
		if (justDead)
		{
			justDead = false;
			deadSound.play();
		}
		if (Reg.restart)
		{
			destroy();
		}
	}
}