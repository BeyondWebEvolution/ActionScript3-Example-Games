package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		
		[Embed(source="data/MenuBackground.png")]
		private var MenuBackgroundPng:Class;
		
		public function MenuState()
		{
			var background:FlxSprite = new FlxSprite();
			background.loadGraphic(MenuBackgroundPng);
			add(background);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.ENTER)
			{
				FlxG.fade(0xff000000, 1, startPlay);
			}
		}
		
		private function startPlay():void
		{
			FlxG.switchState(new PlayState);
		}
	}

}