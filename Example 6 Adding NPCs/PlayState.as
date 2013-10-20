package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var map:MapTilemap;
		private var NPCGroup:NPCSpriteGroup;
		
		public function PlayState()
		{
		
		}
		
		override public function create():void
		{
			map = new MapTilemap();
			add(map);
			
			Registry.player = new PlayerSprite(50, 50);
			add(Registry.player);
			
			NPCGroup = new NPCSpriteGroup();
			add(NPCGroup);
			
			FlxG.worldBounds = new FlxRect(0, 0, map.width, map.height);
			FlxG.camera.setBounds(0, 0, map.width, map.height, true);
			FlxG.camera.follow(Registry.player);
			
			Registry.player.cameras = new Array(FlxG.camera);
		
		}
		
		override public function update():void
		{
			super.update();
		}
	
	}
}