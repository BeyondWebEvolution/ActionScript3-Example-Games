package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class GameOverState extends FlxState
	{
		
		public function GameOverState()
		{
			
			var totalTime:FlxText = new FlxText(50, 61, FlxG.width);
			if (!Registry.hasWon)
			{
				totalTime.text = "You lasted: " + Math.round(Registry.time) + " seconds \n out of 30 total. \n\n(Press SPACE to restart.)";
			}
			else
			{
				totalTime.text = "Awesome! \n\n You won!";
			}
			
			add(totalTime);
		}
		
		override public function update():void
		{
			if (FlxG.keys.SPACE)
			{
				FlxG.switchState(new PlayState);
			}
		}
	}

}