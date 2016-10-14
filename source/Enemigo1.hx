package;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

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

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		loadGraphic(AssetPaths.Enemigo1__png);
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
	
	override public function kill():Void 
	{
		super.kill();
		if (random.int(0, 10) == 9)
		{
			var n:FlxSprite = new PowerUp(x, y);
		}
	}
}