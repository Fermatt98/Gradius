package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemigo3 extends FlxSprite
{
	private var movement:Bool = false;
	private var maxAcceleration:Int = 200;
	private var wasOnScreen:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		loadGraphic(AssetPaths.Enemigo3__png);
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