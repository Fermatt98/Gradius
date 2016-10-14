package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class DisparoBoss extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 20);
		FlxG.state.add(this);
		velocity.x = -170;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (x + width > FlxG.camera.scroll.x + FlxG.width)
		{
			kill();
		}
		if (FlxG.overlap(this, Reg.player))
		{
			Reg.player.kill();
		}
	}
	
}