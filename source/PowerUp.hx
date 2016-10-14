package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class PowerUp extends FlxSprite
{
	private var spawnSFX:FlxSound;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		loadGraphic(AssetPaths.PowerUp__png);
		spawnSFX = FlxG.sound.load(AssetPaths.Powerup__wav);
		
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.overlap(this, Reg.player))
		{
			Reg.powerUp++;
			spawnSFX.play();
			kill();
		}
		if (Reg.powerUp > 4)
		{
			Reg.powerUp = 0;
		}
	}
}