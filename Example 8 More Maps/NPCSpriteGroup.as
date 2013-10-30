package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class NPCSpriteGroup extends FlxGroup
	{
		private var dialog:FlxDialog;
		
		public function NPCSpriteGroup()
		{
			dialog = new FlxDialog(0, 160, FlxG.width, 80);
			dialog.setFormat(null, 8, 0xFFFFFFFF);
			dialog.finishCallback = removeDialogBox;
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(Registry.player, this, showDialog);
		}
		private function showDialog(a:PlayerSprite, b:NPCSprite):void
		{
			if(FlxG.keys.justPressed("ENTER"))
			{
				Registry.player.isStopped = true;
				add(dialog);
				dialog.showDialog(b.speech);
			}	
		}
		private function removeDialogBox():void
		{
			remove(dialog);
			Registry.player.isStopped = false;
		}
	}

}