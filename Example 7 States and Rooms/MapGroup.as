package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	
	public class MapGroup extends FlxGroup
	{
		[Embed(source="data/tilemap.png")]
		private var tilemapPng:Class;
		[Embed(source="data/houseTiles.png")]
		private var houseTilesPng:Class;
		
		[Embed(source="data/map1.txt",mimeType="application/octet-stream")]
		private var villageTxt:Class;
		[Embed(source="data/house1.txt",mimeType="application/octet-stream")]
		private var house1Txt:Class;
		
		private var map:FlxTilemap;
		private var house:FlxTilemap;
		
		private var previousPlace:FlxPoint;
		
		public function MapGroup()
		{
			map = new FlxTilemap();
			map.loadMap(new villageTxt, tilemapPng, 16, 16, 0, 0, 1, 2);
			map.setTileProperties(12, FlxObject.ANY, swapHouse);
			add(map);
			
			house = new FlxTilemap();
			house.loadMap(new house1Txt, houseTilesPng, 16, 16, 0, 0, 1, 2);
			house.setTileProperties(10, FlxObject.ANY, swapMap);
			add(map);
			
			previousPlace = new FlxPoint();
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(Registry.player, this);
		}
		
		private function swapHouse(tile:FlxTile, player:PlayerSprite):void
		{
			previousPlace.x = Registry.player.x;
			previousPlace.y = Registry.player.y;
			
			Registry.player.x = 74;
			Registry.player.y = 64;
			
			remove(map);
			add(house);
		}
		
		private function swapMap(tile:FlxTile, player:PlayerSprite):void
		{
			Registry.player.x = previousPlace.x;
			Registry.player.y = previousPlace.y;
			
			remove(house);
			add(map);
		}
	}

}