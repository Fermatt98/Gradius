package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class CajaEnemigos1 extends FlxBasic
{
	private var timer:Float = 0;
	private var enemyArray:Array<FlxSprite>;
	private var x:Float;
	private var y:Float;

	public function new(X:Float, Y:Float) 
	{
		super();
		FlxG.state.add(this);
		enemyArray = new Array<FlxSprite>();
		x = X;
		y = Y;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.camera.scroll.x + FlxG.width > x)
		{
			timer += elapsed;
			if (timer > 0.4&& enemyArray.length<Reg.cantEnemigos1)
			{
				enemyArray.push(new Enemigo1(FlxG.camera.scroll.x + FlxG.width, y));
				timer = 0;
			}
			if (enemyArray.length >= Reg.cantEnemigos1)
			{
				for (i in 0...enemyArray.length)
				{
					if (!enemyArray[i].isOnScreen())
					{
						enemyArray[i].kill();
					}
				}
			}
		}
	}
}