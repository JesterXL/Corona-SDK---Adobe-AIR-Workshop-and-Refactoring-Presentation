package
{
	
	import com.jessewarden.maps.ScrollingMap;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import net.hires.debug.Stats;
	
	public class Lesson3_c_ScrollRect extends Sprite
	{
		
		private var scrollingMap:ScrollingMap;
		
		public function Lesson3_c_ScrollRect()
		{
			super();	
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			
			var stats:Stats = new Stats();
			addChild(stats);
			stats.y = 400;
			stats.scaleX = stats.scaleY = 2
			
			scrollingMap = new ScrollingMap();
			addChild(scrollingMap);
			scrollingMap.init("map.jpg", 32, 32, 12, 12);
		}
	}
}