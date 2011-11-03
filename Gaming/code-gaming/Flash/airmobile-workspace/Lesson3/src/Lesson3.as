package
{
	import com.jessewarden.maps.MovingMap;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.system.System;
	
	public class Lesson3 extends Sprite
	{
		
		private var movingMap:MovingMap;
		
		public function Lesson3()
		{
			super();	
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			
			// 1280x768, tiles 32x32
			//var loader:Loader = new Loader();
			//addChild(loader);
			//loader.load(new URLRequest("map.jpg"));
			
			movingMap = new MovingMap();
			addChild(movingMap);
			movingMap.init("map.jpg", 32, 32, 12, 12);
		}
	}
}