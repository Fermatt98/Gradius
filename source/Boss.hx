package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


/**
 * ...
 * @author ...
 */
class Boss extends FlxSprite
{
	private var _vida:FlxSprite;
	private var _time:Float = 0;
	private var _timeDisparo:Float = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		FlxG.state.add(this);
		velocity.y = 70;
		_vida = new VidaBoss(x,y-10);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		_timeDisparo += elapsed;
		Reg.ejeX = x;
		Reg.ejeY = y;
		if (_time > 1 && _time < 3)
		{
			velocity.y = -70;
		}
		if (_time >= 3)
		{
			velocity.y = 70;
		}
		if (_time > 4)
		{
			_time = 0;
		}
		if (_timeDisparo > 2)
		{
			Reg.disparoBoss = new DisparoBoss(x,y);
			_timeDisparo = 0;
		}
		for (i in 0...Reg.disparoArray.length)
		{
			if (FlxG.overlap(this, Reg.disparoArray[i]))
			{
				Reg.VidasBoss -= 1;
				if (Reg.VidasBoss == 0)
				{
					Reg.score += Reg.scoreBoss;
					kill();
				}
				Reg.disparoArray[i].kill();
			}
		}
		if (FlxG.overlap(this, Reg.player))
		{
			Reg.player.kill();
		}
	}
	
}