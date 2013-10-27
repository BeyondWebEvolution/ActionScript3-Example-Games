package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source="data/pale.png")]
		private var PalePng:Class;
		
		private var down:Boolean = true;
		
		public function Player(X:Number = 0, Y:Number = 0)
		{
			super(X, Y);
			
			loadGraphic(PalePng, true);
			addAnimation("Run", [0, 1, 2], 12);
			addAnimation("RunDown", [3, 4, 5], 12);
			acceleration.x = 19;
			acceleration.y = 280;
		}
		
		override public function update():void
		{
			
			if (!down)
			{
				play("RunDown");
			}
			else
			{
				play("Run");
			}
			
			if (FlxG.keys.justPressed("SPACE") && !velocity.y)
			{
				if (down)
				{
					down = !down;
					velocity.y = -500;
					acceleration.y = -acceleration.y;
					
				}
				else
				{
					down = !down;
					velocity.y = 500;
					acceleration.y = -acceleration.y;
				}
				
			}
			
			super.update();
		}
	
	}

}