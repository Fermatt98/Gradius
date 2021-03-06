package;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Enemigo1 extends FlxSprite
{
	private var right:Bool = true;
	private var up:Bool = false;
	private var down:Bool = false;
	private var random:FlxRandom;
	private var justDead:Bool;
	private var deadSound:FlxSound;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		justDead = false;
		loadGraphic(AssetPaths.Enemigo1__png);
		deadSound = FlxG.sound.load(AssetPaths.ExplosionEnemigos__wav);
		FlxG.state.add(this);
		random = new FlxRandom();
		//velocity.x = Reg.velocityEnemy1 *-1;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if ((x + width < FlxG.camera.scroll.x + FlxG.width / 3) && right)
		{
			right = false;
			if (Reg.player.y < y)
			{
				up = true;
				velocity.y = Reg.velocityEnemy1 *-1;
			}
			else
			{
				down = true;
				velocity.y = Reg.velocityEnemy1;
			}
			velocity.x = Reg.velocityEnemy1+Reg.velocityCamera;
		}
		else if (right)
		{
			velocity.x = Reg.velocityEnemy1 *-1;
		}
		if (up)
		{
			if (Reg.player.y >= y)
			{
				up = false;
				velocity.y = 0;
			}
		}
		else if (down)
		{
			if (Reg.player.y <= y)
			{
				down = false;
				velocity.y = 0;
			}
		}
		for (i in 0...Reg.disparoArray.length)
		{
			if (FlxG.overlap(this, Reg.disparoArray[i]))
			{
				Reg.score += Reg.scoreEnemigo1;
				justDead = true;
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
			Reg.score += Reg.scoreEnemigo1;
			justDead = true;
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
			Reg.score += Reg.scoreEnemigo1;
			justDead = true;
			kill();
			Reg.misil2.kill();
			if (random.int(0, 10) == 9)
			{
				var n:FlxSprite = new PowerUp(x, y);
			}
		}
		if (FlxG.overlap(this, Reg.misil3))
		{
			Reg.score += Reg.scoreEnemigo1;
			justDead = true;
			kill();
			Reg.misil3.kill();
			if (random.int(0, 5) == 4)
			{
				var n:FlxSprite = new PowerUp(x, y);
			}
		}
		if (FlxG.overlap(this, Reg.escudo))
		{
			justDead = true;
			kill();
			Reg.escudo.qVida(1);
		}
		else if (FlxG.overlap(this, Reg.player))
		{
			Reg.player.kill();
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