package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Bala extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(3, 2);
		velocity.x = Reg.velocityBala;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (x + width > FlxG.camera.scroll.x + FlxG.width)
		{
			kill();
			Reg.DisparosVivos -= 1;
		}
		FlxG.collide(Reg.tilemap, this);
	}
}