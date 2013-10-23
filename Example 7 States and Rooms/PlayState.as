package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var map:MapGroup;
		private var NPCGroup:NPCSpriteGroup;
		
		public function PlayState()
		{
		
		}
		
		override public function create():void
		{
			map = new MapGroup();
			add(map);
			
			Registry.player = new PlayerSprite(32, 32);
			add(Registry.player);
			
			NPCGroup = new NPCSpriteGroup();
			add(NPCGroup);
			
			FlxG.worldBounds = new FlxRect(0, 0, 640, 640);
			FlxG.camera.setBounds(0, 0, 640, 640, true);
			FlxG.camera.follow(Registry.player);
			
			Registry.player.cameras = new Array(FlxG.camera);
		
		}
		
		override public function update():void
		{
			super.update();
		}
	
	}
}