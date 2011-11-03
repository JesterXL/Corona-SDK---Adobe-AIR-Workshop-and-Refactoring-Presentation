package com.jessewarden.maps
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	public class ScrollingMap extends Sprite
	{
		
		private var mapURL:String;
		private var tileWidth:Number;
		private var tileHeight:Number;
		private var rowsToShow:uint;
		private var columsToShow:uint;
		private var viewRect:Rectangle;
		
		private var mapLoader:Loader;
		private var mapBitmap:Bitmap;
		private var sprites:Sprite;
		
		public function ScrollingMap()
		{
			super();
		}
		
		public function init(mapURL:String, tileWidth:Number, tileHeight:Number, rowsToShow:uint, columnsToShow:uint):void
		{
			this.mapURL			= mapURL;
			this.tileWidth		= tileWidth;
			this.tileHeight		= tileHeight;
			this.rowsToShow		= rowsToShow;
			this.columsToShow 	= columnsToShow;
			
			viewRect 			= new Rectangle(0, 0, tileWidth * columnsToShow, tileHeight * rowsToShow);
			
			loadMap(mapURL);
		}
		
		private function loadMap(url:String):void
		{
			if(mapLoader == null)
			{
				mapLoader = new Loader();
				addChild(mapLoader);
				mapLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onMapLoaded);
			}
			
			mapLoader.load(new URLRequest(url));
		}
		
		private function onMapLoaded(event:Event):void
		{
			mapBitmap = mapLoader.content as Bitmap;
			if(sprites)
				setChildIndex(sprites, numChildren - 1);
			
			redrawMap();
		}
		
		private function redrawMap():void
		{
			scrollRect = viewRect;
		}
		
		public function moveMap(direction:String):void
		{
			if(mapBitmap == null)
				return;
			
			var moveSpeed:Number = 1;
			
			switch(direction)
			{
				case "east":
					viewRect.x += moveSpeed;
					break;
			}
			
			redrawMap();
		}
		
		public function addSprite(sprite:DisplayObject):void
		{
			if(sprites == null)
			{
				sprites = new Sprite();
				addChildAt(sprites, numChildren - 1);
			}
			
			sprites.addChild(sprite);
		}
		
	}
}