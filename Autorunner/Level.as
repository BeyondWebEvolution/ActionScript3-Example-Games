package
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	
	public class Level extends FlxGroup
	{
		[Embed(source="data/pattern1.txt",mimeType="application/octet-stream")]
		private var floorLayoutTxt:Class;
		[Embed(source="data/floorTiles.png")]
		private var floorTilesPng:Class;
		
		[Embed(source="data/pattern2.txt",mimeType="application/octet-stream")]
		private var backgroundTxt:Class;
		[Embed(source="data/brick.png")]
		private var backgroundPng:Class;
		
		private var layout:FlxTilemap;
		private var background:FlxTilemap;
		
		public var width:Number;
		
		public function Level()
		{
			background = new FlxTilemap();
			background.loadMap(new backgroundTxt, backgroundPng, 16, 16, FlxTilemap.OFF, 0, 0);
			add(background);
			
			layout = new FlxTilemap();
			layout.loadMap(new floorLayoutTxt, floorTilesPng, 16, 16, FlxTilemap.OFF);
			add(layout);
			
			width = layout.width;
		}
		
		override public function update():void
		{
			FlxG.collide(Registry.player, layout);
		}
		
	}

}