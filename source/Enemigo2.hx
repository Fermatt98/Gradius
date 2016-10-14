package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemigo2 extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (isOnScreen())
		{
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
					kill();
					Reg.disparoArray[i].kill();
				}
			}
			if (FlxG.overlap(this, Reg.player))
			{
				Reg.player.kill();
			}
		}
	}
}