package  
{
	/**
	 * ...
	 * @author Dan Cox
	 */
	public class Assets 
	{
		[Embed(source="data/houseTiles.png")]
		public static var houseTilesPng:Class;
		
		[Embed(source="data/house1.txt",mimeType="application/octet-stream")]
		public static var house1Txt:Class;
		
		[Embed(source="data/house2.txt",mimeType="application/octet-stream")]
		public static var house2Txt:Class;
		
		[Embed(source="data/house3.txt",mimeType="application/octet-stream")]
		public static var house3Txt:Class;
		
		[Embed(source="data/house4.txt",mimeType="application/octet-stream")]
		public static var house4Txt:Class;
		
		[Embed(source="data/tilemap.png")]
		public static var villagePng:Class;
		
		[Embed(source="data/map1.txt",mimeType="application/octet-stream")]
		public static var villageTxt:Class;
		
		[Embed(source="data/NPC1.png")]
		public static var NPCPng:Class;
		
		[Embed(source="data/walk.png")]
		public static var PlayerWalkPng:Class;
		
		public function Assets() 
		{
			
		}
		
	}

}