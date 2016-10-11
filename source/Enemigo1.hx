package;

import flixel.FlxSprite;
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

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		FlxG.state.add(this);
		velocity.x = Reg.velocityEnemy1 *-1;
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
	}
	
}