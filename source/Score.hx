package;

import flixel.text.FlxText;
import flixel.util.FlxColor;

class Score extends FlxText
{
	private var fontSize:Int = 12;
	public function new(X:Float=0, Y:Float=0, FieldWidth:Float=0, ?Text:String, Size:Int=8, EmbeddedFont:Bool=true) 
	{
		super(X, Y, FieldWidth, Text, Size, EmbeddedFont);
		text = "Score " + Std.string(Reg.score);
		setFormat("assets/data/gradius.ttf", fontSize, FlxColor.WHITE, LEFT);
		updateScoreText();
	}
	
	public function updateScoreText()
	{
		var strScore:String = "000000" + Std.string(Reg.score);
		
		if (Reg.score > 0 && Reg.score < 100) strScore = "00000" + Std.string(Reg.score);
		if (Reg.score >= 100 && Reg.score < 1000) strScore = "0000" + Std.string(Reg.score);
		if (Reg.score >= 1000 && Reg.score < 10000) strScore = "000" + Std.string(Reg.score);
		if (Reg.score >= 10000 && Reg.score < 100000) strScore = "00" + Std.string(Reg.score);
		if (Reg.score >= 100000 && Reg.score < 1000000) strScore = "0" + Std.string(Reg.score);
		if (Reg.score >= 1000000) strScore = Std.string(Reg.score);
				
		text = "Score " + strScore;
		if (Reg.score > Reg.highScore) Reg.highScore = Reg.score;
	}
	
}