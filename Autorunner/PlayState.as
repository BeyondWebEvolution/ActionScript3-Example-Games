package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var level:Level;
		
		public function PlayState()
		{
		
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF000000;
			
			level = new Level();
			add(level);
			
			Registry.player = new Player(0, FlxG.height - 32);
			add(Registry.player);
			
			FlxG.camera.setBounds(0, 0, level.width, FlxG.height, true);
			FlxG.camera.follow(Registry.player);
			FlxG.camera.deadzone = new FlxRect(16, 16, 64, 64);
			
			Registry.time = 0;
		}
		
		override public function update():void
		{
			super.update();
			Registry.time += FlxG.elapsed;
			
			if (Registry.player.y < 0 || Registry.player.y > FlxG.height) {
				FlxG.switchState(new GameOverState);
			}
			
			if (Registry.player.x > level.width) {
				Registry.hasWon = true;
				FlxG.switchState(new GameOverState);
			}
			
		}
	
	}

}