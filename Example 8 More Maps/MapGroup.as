package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	
	public class MapGroup extends FlxGroup
	{
		private var previousPlace:FlxPoint;
		private var village:AreaGroup;
		private var areas:Array;
		
		public static var mapIndex:Number;
		
		public function MapGroup()
		{
			village = new AreaGroup(Assets.villageTxt, Assets.villagePng, [11, 12]);
			village.swapFunction = swapHouse;
			
			var npc:NPCSprite = new NPCSprite(48, 320, Assets.NPCPng);
			npc.addSpeech("Hi, player! I'm a NPC.");
			village.characters.add(npc);
			
			add(village);
			
			areas = new Array();
			
			var house1:AreaGroup = new AreaGroup(Assets.house1Txt, Assets.houseTilesPng, [10]);
			house1.swapFunction = swapMap;
			house1.areaIndex = 0;
			areas.push(house1);
			
			var house2:AreaGroup = new AreaGroup(Assets.house2Txt, Assets.houseTilesPng, [10]);
			house2.swapFunction = swapMap;
			house2.areaIndex = 1;
			areas.push(house2);
			
			var house3:AreaGroup = new AreaGroup(Assets.house3Txt, Assets.houseTilesPng, [10]);
			house3.swapFunction = swapMap;
			house3.areaIndex = 2;
			areas.push(house3);
			
			var house4:AreaGroup = new AreaGroup(Assets.house4Txt, Assets.houseTilesPng, [10]);
			house4.swapFunction = swapMap;
			house4.areaIndex = 3;
			areas.push(house4);
			
			previousPlace = new FlxPoint();
		
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(Registry.player, this);
		}
		
		private function swapHouse(index:FlxPoint):void
		{
			previousPlace.x = Registry.player.x;
			previousPlace.y = Registry.player.y;
			
			if (index.y == 304)
			{
				if (index.x == 80)
				{
					mapIndex = 0;
				}
				else
				{
					mapIndex = 1;
				}
				
			}
			if (index.y == 480)
			{
				if (index.x == 112)
				{
					mapIndex = 2;
				}
				else
				{
					mapIndex = 3;
				}
			}
			
			Registry.player.x = Registry.player.y = 128;
			
			remove(village);
			add(areas[mapIndex]);
		}
		
		private function swapMap(index:FlxPoint):void
		{
			Registry.player.x = previousPlace.x;
			Registry.player.y = previousPlace.y;
			
			remove(areas[mapIndex]);
			add(village);
		}
	}

}