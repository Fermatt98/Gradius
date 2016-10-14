package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class Interfaz extends FlxTypedGroup<FlxSprite>
{
	inline static public var pUpBarHeigh = 32;
	private var hudBack:FlxSprite;
	private var box:Array<FlxSprite>;
	private var speedUpText:FlxText;
	private var misileText:FlxText;
	private var optionText:FlxText;
	private var shieldText:FlxText;
	private var lifeText:FlxText;
	private var fontSize = 10;
	private var scoreText:Score;
	private var hiScoreText:HighScore;
	private var vidaNave:FlxSprite;
	
	public function new()
	{
		super();
		hudBack = new FlxSprite(0, FlxG.height - pUpBarHeigh);
		hudBack.makeGraphic(FlxG.width, pUpBarHeigh, FlxColor.BLACK);
		add(hudBack);		
		createBox(32, FlxG.height - pUpBarHeigh);
		speedUpText = new FlxText(32, FlxG.height - pUpBarHeigh+1);
		speedUpText.text = "SPEED UP";
		speedUpText.setFormat("assets/data/gradius.ttf", 8, FlxColor.BLACK, LEFT);	
		createBox(32+48, FlxG.height - pUpBarHeigh);
		misileText = new FlxText(36 + 48, FlxG.height - pUpBarHeigh+1);
		misileText.text = "MISILE";
		misileText.setFormat("assets/data/gradius.ttf", fontSize, FlxColor.BLACK, LEFT);
		createBox(32 + 48 * 2, FlxG.height - pUpBarHeigh);
		optionText = new FlxText(34 + 48 * 2, FlxG.height - pUpBarHeigh+1);
		optionText.text = "OPTION";
		optionText.setFormat("assets/data/gradius.ttf", fontSize, FlxColor.BLACK, LEFT);
		createBox(32 + 48 * 3, FlxG.height - pUpBarHeigh);	
		shieldText = new FlxText(36 + 48 * 3, FlxG.height - pUpBarHeigh+1);
		shieldText.text = "??????";
		shieldText.setFormat("assets/data/gradius.ttf", fontSize, FlxColor.BLACK, CENTER);
		lifeText = new FlxText( 32, FlxG.height- pUpBarHeigh + 16);
		lifeText.text = "x" + Reg.playerVidas;
		lifeText.setFormat("assets/data/gradius.ttf", fontSize, FlxColor.WHITE, CENTER);
		vidaNave = new FlxSprite(16, FlxG.height - pUpBarHeigh + 16);
		vidaNave.makeGraphic(16, 16);
		vidaNave.loadGraphic(AssetPaths.Vida__png);
		scoreText = new Score(FlxG.width / 4+12, FlxG.height - 16);
		hiScoreText = new HighScore(176, FlxG.height - 16);
		
		add(speedUpText);
		add(optionText);
		add(shieldText);
		add(misileText);
		add(lifeText);
		add(scoreText);
		add(hiScoreText);
		add(vidaNave);
		forEach(function(spr:FlxSprite)
        {
			spr.scrollFactor.set(0, 0);
		});
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		speedUpText.color = FlxColor.BLACK;
		misileText.color = FlxColor.BLACK;
		optionText.color = FlxColor.BLACK;
		shieldText.color = FlxColor.BLACK;
		if (Reg.speedUpPower == Reg.maxSpeedUp)	
			speedUpText.text = " ";
		else
			speedUpText.text = "Speed Up";
		if (Reg.misilOn == true)
			misileText.text = " ";
		else
			misileText.text = "MISILE";	
		if (Reg.optionOn == true)
			optionText.text = " ";
		else
			optionText.text = "OPTION";
		if (Reg.escudoOn == true)
			shieldText.text = " ";
		else
			shieldText.text = "??????";
			
		scoreText.updateScoreText();
		hiScoreText.updateHiScoreText();
		lifeText.text = "x" + Reg.playerVidas;
		switch(Reg.powerUp)
		{
			case 1:
				if (Reg.speedUpPower != Reg.maxSpeedUp)
				{
					speedUpText.color = FlxColor.YELLOW;
				}
				else
				{
					Reg.powerUp++;
				}
			case 2:
				if (Reg.misilOn != true)
				{
					misileText.color = FlxColor.YELLOW;
				}
				else
				{
					Reg.powerUp++;
				}
			case 3:
				if (Reg.optionOn != true)
				{
					optionText.color = FlxColor.YELLOW;
				}
				else
				{
					Reg.powerUp++;
				}
			case 4:
				if (Reg.escudoOn != true)
				{
					shieldText.color = FlxColor.YELLOW;
				}
				else
				{
					Reg.powerUp++;
				}
		}
	}
	private function createBox(x:Float, y:Float)
	{
		var box1:FlxSprite;
		var box2:FlxSprite;		
		box2 = new FlxSprite(x+1, y+1);
		box2.makeGraphic(44, 13,0xff4239ff);
		box1 = new FlxSprite(x, y);
		box1.makeGraphic(46, 15,FlxColor.WHITE);
		add(box1);
		add(box2);
	}
}