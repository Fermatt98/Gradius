package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Escudo extends FlxSprite
{
	inline static private var cantMaxEscudo = 10;
	private var vidaEscudo:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4, 10);
		loadGraphic(AssetPaths.escudo__png);
		vidaEscudo = cantMaxEscudo;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		this.x = Reg.player.x + Reg.player.width+1;
		this.y = Reg.player.y-1;
		if (FlxG.overlap(this,Reg.disparoBoss))
		{
			vidaEscudo -= 1;
			Reg.disparoBoss.kill();
		}
		if (vidaEscudo <= 0)
		{
			kill();
		}
	}
	public function qVida(vida:Int):Void
	{
		vidaEscudo -= vida;
	}
}