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
		private var map:MapTilemap;
		private var dialog:FlxDialog;
		
		public function PlayState()
		{	
			
		}
		override public function create():void 
		{
			map = new MapTilemap();
			add(map);
			
			player = new PlayerSprite(50,50);
			add(player);
			
			FlxG.worldBounds = new FlxRect(0, 0, map.width, map.height);
			FlxG.camera.setBounds(0, 0, map.width, map.height, true);
			FlxG.camera.follow(player);
			
			player.cameras = new Array(FlxG.camera);
			
			dialog = new FlxDialog(0, 160, FlxG.width, 80);
			dialog.setFormat(null, 8, 0xFFFFFFFF);
			dialog.finishCallback = removeDialogBox;
			
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(player, map);
			
			if (FlxG.keys.ENTER) 
			{
				var blank:Array = new Array();
				blank.push("You pressed 'Enter'!");
				dialog.showDialog(blank);
				add(dialog);
				player.isStopped = true;
			}
		}
		private function removeDialogBox():void
		{
			remove(dialog);
			player.isStopped = false;
		}
	}
}