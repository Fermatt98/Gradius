package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Option2 extends FlxSprite
{
	private var lista:List<FlxPoint>;
	private var position:FlxPoint;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(12, 12);
		loadGraphic(AssetPaths.loop__png);
		position = new FlxPoint();
		lista = new List<FlxPoint>();
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (lista.length > 16)
		{
			position = lista.pop();
			x = position.x;
			y = position.y;
		}
		if (Reg.movementBool || Reg.movementBool2)
		{
			var data:FlxPoint = new FlxPoint();
			data.set(Reg.option.x, Reg.option.y);
			lista.add(data);
		}
		velocity.x = Reg.scroll.velocity.x;
	}
	
}