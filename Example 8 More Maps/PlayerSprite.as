package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class PlayerSprite extends FlxSprite
	{
		private var speed:int = 144;
		public var isStopped:Boolean = false;
		
		public function PlayerSprite(X:Number = 0, Y:Number = 0)
		{
			super(X, Y);
			
			loadGraphic(Assets.PlayerWalkPng, true, false);
			
			addAnimation("Down", [0, 1, 2], 10, false);
			addAnimation("Right", [3, 4, 5], 10, false);
			addAnimation("Left", [6, 7, 8], 10, false);
			addAnimation("Up", [9, 10, 11], 10, false);
		}
		
		override public function update():void
		{
			super.update();
			
			velocity.x = 0;
			velocity.y = 0;
			
			if (!isStopped)
			{
				if (FlxG.keys.W || FlxG.keys.UP)
				{
					velocity.y -= speed;
					play("Up");
				}
				else if (FlxG.keys.S || FlxG.keys.DOWN)
				{
					velocity.y += speed;
					play("Down");
				}
				else if (FlxG.keys.A || FlxG.keys.LEFT)
				{
					velocity.x -= speed;
					play("Left");
				}
				else if (FlxG.keys.D || FlxG.keys.RIGHT)
				{
					velocity.x += speed;
					play("Right");
				}
			}
		
		}
	
	}

}