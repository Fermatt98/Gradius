package;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class CajaDisparo extends FlxBasic
{
	private var _time:Float = 0;
	private var _a:Int = 0;
	private var shootSFX:FlxSound;
	
	public function new()
	{
		super();
		Reg.disparoArray = new Array<FlxSprite>();
		shootSFX = FlxG.sound.load(AssetPaths.Shoot__wav);
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (FlxG.keys.pressed.X && _time > Reg.controlCaja && Reg.DisparosVivos <= 1 && Reg.player.exists)
		{
			Reg.DisparosVivos += 1;
			Reg.disparoArray[_a] = new Bala(Reg.player.x, Reg.player.y, true);
			shootSFX.play();
			if (Reg.option.exists)
			{
				_a++;
				Reg.disparoArray[_a] = new Bala(Reg.option.x, Reg.option.y);
			}
			if (Reg.option2.exists)
			{
				_a++;
				Reg.disparoArray[_a] = new Bala(Reg.option2.x, Reg.option2.y);
			}
			if (Reg.misilOn == true)
			{
				if (!Reg.misilVivo)
				{
					Reg.misilVivo = true;
					Reg.misil = new Misil(Reg.player.x, Reg.player.y);
					if (Reg.option.exists)
					{
						Reg.misil2 = new Misil(Reg.option.x, Reg.option.y);
					}
					if (Reg.option2.exists)
					{
						Reg.misil3 = new Misil(Reg.option2.x, Reg.option2.y);
					}
				}
			}
			_a += 1;
			_time = 0;
		}
	}
}