package
{
	import org.flixel.*;
	
	public class FlxDialog extends FlxGroup
	{
		/**
		 * Use this to tell if dialog is showing on the screen or not.
		 */
		public var showing:Boolean;
		
		/**
		 * The text field used to display the text
		 */
		private var _field:FlxText;
		
		/**
		 * Called when dialog is finished (optional)
		 */
		private var _finishCallback:Function;
		
		/**
		 * Stores all of the text to be displayed. Each "page" is a string in the array
		 */
		private var _dialogArray:Array;
		
		/**
		 * Background rect for the text
		 */
		private var _bg:FlxSprite;
		private var _bgc:FlxSprite;
		
		internal var _pageIndex:int;
		internal var _displaying:Boolean;
		internal var _endPage:Boolean;
		
		internal var _key:String;
		
		/**
		 * The FlxDialog Constructor
		 * @param	X
		 * @param	Y
		 * @param	Width
		 * @param	Height
		 * @param	displaySpeed
		 * @param	backgroundColor
		 * @param	outlineColor
		 */
		public function FlxDialog(X:Number = 0, Y:Number = 0, Width:Number = 310, Height:Number = 72, backgroundColor:uint = 0xFF000000, outlineColor:uint = 0xFF3765FF, outlineThickness:uint = 2)
		{
			_bg = new FlxSprite(X, Y).makeGraphic(Width, Height, outlineColor);
			_bgc = new FlxSprite(X + outlineThickness, Y + outlineThickness).makeGraphic(Width - outlineThickness * 2, Height - outlineThickness * 2, backgroundColor);
			_bg.scrollFactor.x = _bg.scrollFactor.y = _bgc.scrollFactor.x = _bgc.scrollFactor.y = 0;
			add(_bg);
			add(_bgc);
			
			_field = new FlxText(_bgc.x + outlineThickness, _bgc.y + outlineThickness, Width, "");
			_field.scrollFactor.x = _field.scrollFactor.y = 0;
			add(_field);
			
			_bg.alpha = _bgc.alpha = 0;
			
			_key = "SPACE";
		}
		
		/**
		 * Change the key to press to progress the dialog
		 * @param	key
		 */
		public function setKey(key:String):void
		{
			_key = key;
		}
		
		/**
		 * Set the formatting of the FlxText internal object
		 * @param	font
		 * @param	Size
		 * @param	Color
		 * @param	Alignment
		 * @param	ShadowColor
		 */
		public function setFormat(font:String = null, Size:Number = 8, Color:uint = 0xffffff, Alignment:String = null, ShadowColor:uint = 0):void
		{
			_field.setFormat(font, Size, Color, Alignment, ShadowColor);
		}
		
		/**
		 * Prepare to show the dialog
		 * @param	pages
		 */
		public function showDialog(pages:Array):void
		{
			_pageIndex = 0;
			_field.text = pages[0];
			_dialogArray = pages;
			_displaying = true;
			_bg.alpha = _bgc.alpha = 1;
			showing = true;
		}
		
		/**
		 * Update the FlxDialog object
		 */
		override public function update():void
		{
			if (_displaying)
			{
				_field.text = _dialogArray[_pageIndex];
			}
			
			if (FlxG.keys.justReleased(_key))
			{
				if (_displaying)
				{
					_displaying = false;
					_field.text = _dialogArray[_pageIndex];
					
					if (_pageIndex == _dialogArray.length - 1)
					{
						_pageIndex = 0;
						_field.text = "";
						_bg.alpha = _bgc.alpha = 0;
						if (_finishCallback != null)
							_finishCallback();
						showing = false;
					}
					else
					{
						_pageIndex++;
						_displaying = true;
					}
				}
			}
			
			super.update();
		}
		
		/**
		 * Set the callback function for when all pages have been displayed
		 */
		public function set finishCallback(val:Function):void
		{
			_finishCallback = val;
		}
	
	}
}