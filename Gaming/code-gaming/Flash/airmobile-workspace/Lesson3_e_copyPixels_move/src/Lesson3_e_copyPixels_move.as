package
{
	
	import com.jessewarden.maps.MovingMap;
	import com.jessewarden.maps.ScrollingMap;
	
	import flash.desktop.NativeApplication;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.system.System;
	
	import net.hires.debug.Stats;
	
	public class Lesson3_e_copyPixels_move extends Sprite
	{
		
		private var movingMap:MovingMap;
		
		public function Lesson3_e_copyPixels_move()
		{
			super();	
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, onDeactivate);
			
			var stats:Stats = new Stats();
			addChild(stats);
			stats.y = 400;
			
			movingMap = new MovingMap();
			addChild(movingMap);
			movingMap.init("map.jpg", 32, 32, 12, 12);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			movingMap.moveMap("east");
		}
		
		private function onDeactivate(event:Event):void
		{
			NativeApplication.nativeApplication.exit();
		}
	}
}