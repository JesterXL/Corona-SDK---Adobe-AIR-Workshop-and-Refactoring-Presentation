package com.jessewarden.gui
{
	import com.jessewarden.constants.Direction;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class ArrowButton extends Sprite
	{
		private var _direction:String;
		private var loader:Loader;
		
		public function get direction():String { return _direction; }
		
		public function ArrowButton(direction:String)
		{
			super();
			
			this.mouseChildren = false;
			
			_direction = direction;
			
			loader = new Loader();
			addChild(loader);
			
			var imageToLoad:String;
			switch(_direction)
			{
				case Direction.EAST:
					imageToLoad = "button-arrow-east.png";
					break;
				
				case Direction.WEST:
					imageToLoad = "button-arrow-west.png";
					break;
				
				case Direction.NORTH:
					imageToLoad = "button-arrow-north.png";
					break;
				
				case Direction.SOUTH:
					imageToLoad = "button-arrow-south.png";
					break;
			}
			
			loader.load(new URLRequest(imageToLoad));
		}
		
		public function move(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
	}
}