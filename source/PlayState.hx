package;//Simple music Player

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var curSong:FlxText; 
	var song:Array<String> = ['Music', 'Music2'];
	var music:FlxSound;
	var smpImg:FlxSprite; //Not simp, simple music player

	override public function create()
	{
		super.create();
		
		FlxG.autoPause = false;

		smpImg = new FlxSprite(-50, 0).loadGraphic('assets/images/Smp.png');
		smpImg.updateHitbox();
		smpImg.antialiasing = true;
		smpImg.scrollFactor.set();
		smpImg.screenCenter();
		smpImg.alpha = 1;
		add(smpImg);

		// curSong = new FlxText("Press Space To play the song");
		curSong = new FlxText("Press Enter to Play Or Press Space to Pause!");
		curSong.setFormat("assets/fonts/Bayshore.ttf");
		curSong.size = 45;
		curSong.antialiasing = true;
		curSong.width = -50;
		curSong.updateHitbox();
		curSong.antialiasing = true;
		add(curSong);
		curSong.scrollFactor.set();
		curSong.screenCenter();

		curSong.alpha = 0;
		add(curSong);

		music = FlxG.sound.load("assets/music/" + "Music" + ".ogg", 1, true);
		music.active = true;

		// if(music.exists)
		// {
				
		// }
		

		// if (FlxG.sound.music == null)
		// 	{
		// 		FlxG.sound.playMusic(AssetPaths.Music__wav, 1, true);
		// 	}

		

		// FlxG.sound.play("assets/music/Music.mp3", 1, true);

	}

	override public function update(elapsed:Float)
	{	

		if(FlxG.keys.justPressed.ENTER)
			music.play();
		else if(FlxG.keys.justPressed.SPACE)
			music.pause();

		// //,
		// if(FlxG.keys.)
		// 	FlxTween.tween(curSong, {alpha: 0}, 1.8, {type:FlxTweenType.PINGPONG, ease:FlxEase.quadInOut});
			

		// pitch easter egg
		if(FlxG.keys.pressed.LEFT)
			music.pitch -= 0.01;
		else if(FlxG.keys.pressed.RIGHT)
			music.pitch += 0.01;
		else if(FlxG.keys.justPressed.CONTROL)
			music.pitch = 1;
		

		super.update(elapsed);
	}

}
