package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	 
	public class PlayState extends FlxState 
	{
		private var player:PlayerSprite;
		
		public function PlayState() 
		{	
			player = new PlayerSprite();
			add(player);
		}
		override public function update():void
		{
			super.update();
		}
		
	}

}