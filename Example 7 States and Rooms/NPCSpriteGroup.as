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
		
		private var npc:NPCSprite;
		
		[Embed(source="data/NPC1.png")]
		private var NPCPng:Class;
		
		public function NPCSpriteGroup()
		{
			dialog = new FlxDialog(0, 160, FlxG.width, 80);
			dialog.setFormat(null, 8, 0xFFFFFFFF);
			dialog.finishCallback = removeDialogBox;
			
			npc = new NPCSprite(48, 320, NPCPng);
			npc.addSpeech("Hi, player! I'm a NPC.");
			add(npc);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(Registry.player, npc, showDialog);
		}
		private function showDialog(a:FlxObject, b:FlxObject):void
		{
			if(FlxG.keys.justPressed("ENTER"))
			{
				Registry.player.isStopped = true;
				add(dialog);
				dialog.showDialog(npc.speech);
			}	
		}
		private function removeDialogBox():void
		{
			remove(dialog);
			Registry.player.isStopped = false;
		}
	}

}