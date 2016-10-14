package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.system.FlxSound;


/**
 * ...
 * @author ...
 */
class Boss extends FlxSprite
{
	private var _vida:FlxSprite;
	private var _time:Float = 0;
	private var _timeDisparo:Float = 0;
	private var justDead:Bool;
	private var deadSound:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		justDead = true;
		loadGraphic(AssetPaths.Boss__png);
		FlxG.state.add(this);
		velocity.y = 70;
		Reg.VidasBoss = 30;
		deadSound = FlxG.sound.load(AssetPaths.ExplosionEnemigos__wav);
		_vida = new VidaBoss(x,y-10);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		_timeDisparo += elapsed;
		Reg.ejeX = x;
		Reg.ejeY = y;
		if (y < 0)
		{
			velocity.y = 70;
		}
		else if (y + height > FlxG.height - 32)
		{
			velocity.y = -70;
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
				if (Reg.VidasBoss <= 0)
				{
					Reg.score += Reg.scoreBoss;
					kill();
				}
				Reg.disparoArray[i].kill();
			}
		}
		if (FlxG.overlap(this, Reg.misil))
		{
			Reg.VidasBoss -= 1;
			if (Reg.VidasBoss == 0)
			{
				Reg.score += Reg.scoreBoss;
				kill();
			}
			Reg.misil.kill();
			Reg.misilVivo = false;
		}
		if (FlxG.overlap(this, Reg.misil2))
		{
			Reg.VidasBoss -= 1;
			if (Reg.VidasBoss == 0)
			{
				Reg.score += Reg.scoreBoss;
				kill();
			}
			Reg.misil2.kill();
		}
		if (FlxG.overlap(this, Reg.misil3))
		{
			Reg.VidasBoss -= 1;
			if (Reg.VidasBoss == 0)
			{
				Reg.score += Reg.scoreBoss;
				kill();
			}
			Reg.misil3.kill();
		}
		if (FlxG.overlap(this, Reg.player))
		{
			Reg.player.kill();
		}
	}
	override public function kill():Void 
	{
		super.kill();
		Reg.restart = true;
		if (justDead)
		{
			justDead = false;
			deadSound.play();
		}
		if (Reg.restart)
		{
			destroy();
		}
	}
}