package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Mountain extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, type, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(96, 96);
		switch(type){
			case 0:
				loadGraphic(AssetPaths.mountain_0__png);
			case 1:
				loadGraphic(AssetPaths.mountain_1__png);
			case 2:
				loadGraphic(AssetPaths.mountain_2__png);
			case 3:
				loadGraphic(AssetPaths.mountain_3__png);
		}
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.pixelPerfectOverlap(this, Reg.player))
		{
			Reg.player.kill();
		}
		if (Reg.misilVivo)
		{
			if (FlxG.pixelPerfectOverlap(this, Reg.misil))
			{
				Reg.misil.kill();
				Reg.misilVivo = false;
			}
			if (FlxG.pixelPerfectOverlap(this, Reg.misil2))
			{
				Reg.misil.kill();
				Reg.misilVivo = false;
			}
			if (FlxG.pixelPerfectOverlap(this, Reg.misil3))
			{
				Reg.misil.kill();
				Reg.misilVivo = false;
			}
		}
	}
	
}