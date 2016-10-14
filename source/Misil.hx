package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Misil extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(3, 2);
		loadGraphic(AssetPaths.Misil__png);
		velocity.x = Reg.misilVelocity;
		velocity.y = Reg.misilVelocity;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (x + width > FlxG.camera.scroll.x + FlxG.width)
		{
			kill();
			Reg.misilVivo = false;
		}
		if (y + height > FlxG.camera.scroll.y + FlxG.width)
		{
			kill();
			Reg.misilVivo = false;
		}
		velocity.y = Reg.misilVelocity;
		FlxG.collide(Reg.tilemap, this);
	}
}