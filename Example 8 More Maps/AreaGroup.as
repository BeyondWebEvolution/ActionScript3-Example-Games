package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*; 
	import org.flixel.system.FlxTile;
	 
	public class AreaGroup extends FlxGroup 
	{
		private var areaMap:FlxTilemap;
		private var _swapFunction:Function;
		private var doorTiles:Array;
		
		public var doorPoint:FlxPoint;
		public var characters:NPCSpriteGroup;
		public var areaIndex:Number;
		
		/**
		 * AreaGroup
		 * @param	map			The tilemap data
		 * @param	tiles		The tiles
		 * @param	dTs			The door or exit tile numbers
		 */
		public function AreaGroup(map:Class, tiles:Class, dTs:Array)
		{
			doorTiles = dTs;
			
			areaMap = new FlxTilemap();
			areaMap.loadMap(new map, tiles, 16, 16, 0, 0, 1, 2);	
			add(areaMap);
			
			characters = new NPCSpriteGroup();
			add(characters);
			
			doorPoint = new FlxPoint();
			
		}
		public function set swapFunction(func:Function):void
		{
			_swapFunction = func;
			for each(var index:Number in doorTiles) 
			{
				areaMap.setTileProperties(index, FlxObject.ANY, setIndexSwap);
			}
			
		}
		private function setIndexSwap(tile:FlxTile, player:PlayerSprite):void
		{
			MapGroup.mapIndex = areaIndex;
			doorPoint.x = tile.x;
			doorPoint.y = tile.y;
			_swapFunction(doorPoint);
		}
		
	}

}