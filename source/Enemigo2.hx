package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class Enemigo2 extends FlxSprite
{
	private var wasOnScreen:Bool = false;
	private var random:FlxRandom;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		loadGraphic(AssetPaths.Enemigo2__png);
		random = new FlxRandom();
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
			wasOnScreen = true;
			if (Reg.player.y + Reg.player.height < y || Reg.player.y > y + height)
			{
				if (Reg.player.y + Reg.player.height < y)
				{
					velocity.y = Reg.velocityEnemy2 *-1;
					velocity.x = Reg.velocityEnemy2 *-1;
				}
				else
				{
					velocity.y = Reg.velocityEnemy2;
					velocity.x = Reg.velocityEnemy2 *-1;
				}
			}
			else
			{
				velocity.y = 0;
				velocity.x = Reg.velocityEnemy2 *-2;
			}
			for (i in 0...Reg.disparoArray.length)
			{
				if (FlxG.overlap(this, Reg.disparoArray[i]))
				{
					Reg.score += Reg.scoreEnemigo2;
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
				Reg.score += Reg.scoreEnemigo2;
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
				Reg.score += Reg.scoreEnemigo2;
				kill();
				Reg.misil2.kill();
				if (random.int(0, 10) == 9)
				{
					var n:FlxSprite = new PowerUp(x, y);
				}
			}
			if (FlxG.overlap(this, Reg.misil3))
			{
				Reg.score += Reg.scoreEnemigo2;
				kill();
				Reg.misil3.kill();
				if (random.int(0, 10) == 9)
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
			kill();
		}
	}
}