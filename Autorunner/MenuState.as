package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source="data/Menu.png")]
		private var backgroundPng:Class;
		
		public function MenuState()
		{
			var background:FlxSprite = new FlxSprite(0, 0, backgroundPng);
			add(background);
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