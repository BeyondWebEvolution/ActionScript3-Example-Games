package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	 
	public class PlayState extends FlxState 
	{
		
		public function PlayState() 
		{
			var background:FlxSprite;
			background = new FlxSprite();
			background.makeGraphic(100, 100);
			add(background);
		}
		
	}

}