package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 8);
		FlxG.state.add(this);
		//scrollFactor.x = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.UP)
		{
			velocity.y = -Reg.velocity;
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = Reg.velocity;
		}
		else
		{
			velocity.y = 0;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			velocity.x = -Reg.velocity;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			velocity.x = Reg.velocity;
		}
		else
		{
			velocity.x = 0;
		}
	}
	
}