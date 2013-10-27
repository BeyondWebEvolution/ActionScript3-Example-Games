package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	[SWF(width="450",height="288",backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")] 
	 
	public class Pale extends FlxGame
	{
		
		public function Pale() 
		{
			super(225, 144, MenuState, 2);
			forceDebugger = false;
		}
		
	}

}