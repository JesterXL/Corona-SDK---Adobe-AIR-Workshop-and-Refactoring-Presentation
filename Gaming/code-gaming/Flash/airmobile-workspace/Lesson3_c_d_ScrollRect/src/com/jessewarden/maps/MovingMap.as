package com.jessewarden.maps
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	public class MovingMap extends Sprite
	{
		
		private var mapURL:String;
		private var tileWidth:Number;
		private var tileHeight:Number;
		private var rowsToShow:uint;
		private var columsToShow:uint;
		private var viewRect:Rectangle;
		private var copyRect:Rectangle;
		
		private var mapLoader:Loader;
		private var mapBitmapData:BitmapData;
		private var mapBitmap:Bitmap;
		private var sourceBitmapData:BitmapData;
		private var targetPoint:Point = new Point(0, 0);
		
		public function MovingMap()
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
			copyRect			= viewRect.clone();
			
			loadMap(mapURL);
		}
		
		private function loadMap(url:String):void
		{
			if(mapLoader == null)
			{
				mapLoader = new Loader();
				mapLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onMapLoaded);
			}
			
			mapLoader.load(new URLRequest(url));
		}
		
		private function onMapLoaded(event:Event):void
		{
			sourceBitmapData = Bitmap(mapLoader.content).bitmapData;
			
			mapBitmapData = new BitmapData(viewRect.width, viewRect.height, false, 0);
			
			mapBitmap = new Bitmap(mapBitmapData);
			addChild(mapBitmap);
			
			redrawMap();
		}
		
		private function redrawMap():void
		{
			mapBitmapData.copyPixels(sourceBitmapData, copyRect, targetPoint);
		}
		
		
		
	}
}