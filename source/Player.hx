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
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.UP)
		{
			velocity.y = -Reg.velocityPlayer;
			Reg.movementBool2 = true;
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = Reg.velocityPlayer;
			Reg.movementBool2 = true;
		}
		else
		{
			velocity.y = 0;
			Reg.movementBool2 = false;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			velocity.x = -Reg.velocityPlayer;
			Reg.movementBool = true;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			velocity.x = Reg.velocityPlayer;
			Reg.movementBool = true;
		}
		else if(Reg.scroll.x < FlxG.camera.maxScrollX - FlxG.width/2)
		{
			velocity.x = Reg.scroll.velocity.x;
			Reg.movementBool = false;
		}
		else
		{
			velocity.x = 0;
			Reg.movementBool = false;
		}
		if (x < FlxG.camera.scroll.x)
		{
			x = FlxG.camera.scroll.x;
		}
		if (x + width > FlxG.camera.scroll.x + FlxG.width)
		{
			x = FlxG.camera.scroll.x + FlxG.width - width;
		}
	}
	
	override public function kill():Void 
	{
		super.kill();
		Reg.dead = true;
	}
	
}