package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class HighScore extends FlxText
{
	private var fontSize:Int = 12;
	public function new(X:Float=0, Y:Float=0, FieldWidth:Float=0, ?Text:String, Size:Int=8, EmbeddedFont:Bool=true) 
	{
		super(X, Y, FieldWidth, Text, Size, EmbeddedFont);
		text = "Hi " + Std.string(Reg.highScore);
		setFormat("assets/data/gradius.ttf", fontSize, FlxColor.WHITE, LEFT);
		updateHiScoreText();
	}
	
	public function updateHiScoreText()
	{
		var strScore:String = "000000" + Std.string(Reg.highScore);
		
		if (Reg.highScore > 0 && Reg.highScore < 100) strScore = "00000" + Std.string(Reg.highScore);
		if (Reg.highScore >= 100 && Reg.highScore < 1000) strScore = "0000" + Std.string(Reg.highScore);
		if (Reg.highScore >= 1000 && Reg.highScore < 10000) strScore = "000" + Std.string(Reg.highScore);
		if (Reg.highScore >= 10000 && Reg.highScore < 100000) strScore = "00" + Std.string(Reg.highScore);
		if (Reg.highScore >= 100000 && Reg.highScore < 1000000) strScore = "0" + Std.string(Reg.highScore);
		if (Reg.highScore >= 1000000) strScore = Std.string(Reg.highScore);
				
		text = "Hi " + strScore;
	}	
}