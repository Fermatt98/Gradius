package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class CajaEnemigos1 extends FlxBasic
{
	private var timer:Float = 0;
	private var enemyCont:Int = 0;
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
		timer += elapsed;
		if (timer > 0.4&& enemyArray.length<5)
		{
			enemyArray.push(new Enemigo1(x, y));
			timer = 0;
		}
		if (enemyArray.length >= 5)
		{
			for (i in 0...enemyArray.length)
			{
				if (!enemyArray[i].exists)
				{
					enemyCont++;
				}
			}
			if (enemyCont == 5)
			{
				trace("POWER UP");
			}
			else
			{
				enemyCont = 0;
			}
		}
	}
}