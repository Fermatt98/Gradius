package;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class CajaDisparo extends FlxBasic
{
	private var _time:Float = 0;
	private var _a:Int=0;
	public function new()
	{
		super();
		Reg.disparoArray = new Array<FlxSprite>();
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (FlxG.keys.pressed.SPACE && _time > Reg.controlCaja && Reg.DisparosVivos <= 1)
		{
			Reg.DisparosVivos += 1;
			Reg.disparoArray[_a] = new Bala(Reg.player.x, Reg.player.y);
			if (Reg.misilOn == true)
			{
				if (!Reg.misilVivo)
				{
					Reg.misilVivo = true;
					Reg.misil = new Misil(Reg.player.x, Reg.player.y);
				}
			}
			_a += 1;
			_time = 0;
		}
	}
}