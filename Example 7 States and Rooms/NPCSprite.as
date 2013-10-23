package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*; 
	 
	public class NPCSprite extends FlxSprite
	{
		public var speech:Array;
		
		public function NPCSprite(X:Number = 0, Y:Number = 0, Image:Class = null)
		{
			super(X, Y, Image);
			immovable = true;
			speech = new Array();
		}
		public function addSpeech(line:String):void
		{
			speech.push(line);
		}
		
	}

}