package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	[SWF(width="640",height="480",backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")] 
	 
	public class ExampleRPG extends FlxGame
	{
		
		public function ExampleRPG() 
		{
			super(320, 240, MenuState, 2);
			forceDebugger = false;
		}
		
	}

}