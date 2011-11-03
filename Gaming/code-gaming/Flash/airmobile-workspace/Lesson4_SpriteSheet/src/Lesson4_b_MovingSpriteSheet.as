package
{
	
	import com.jessewarden.constants.Direction;
	import com.jessewarden.gui.ArrowButton;
	import com.jessewarden.maps.ScrollingMap;
	import com.jessewarden.sprites.Character;
	
	import flash.desktop.NativeApplication;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.dns.AAAARecord;
	import flash.system.Capabilities;
	import flash.system.System;
	
	import net.hires.debug.Stats;
	
	public class Lesson4_b_MovingSpriteSheet extends Sprite
	{
		
		private var scrollingMap:ScrollingMap;
		private var character:Character;
		private var northButton:ArrowButton;
		private var eastButton:ArrowButton;
		private var southButton:ArrowButton;
		private var westButton:ArrowButton;
		
		public function Lesson4_b_MovingSpriteSheet()
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
			
			
			scrollingMap = new ScrollingMap();
			addChild(scrollingMap);
			scrollingMap.init("map.jpg", 32, 32, 12, 12);
			
			character = new Character();
			character.init();
			scrollingMap.addSprite(character);
			
			northButton = makeButton(Direction.NORTH);
			eastButton = makeButton(Direction.EAST);
			southButton = makeButton(Direction.SOUTH);
			westButton = makeButton(Direction.WEST);
			
			northButton.move(stage.stageWidth / 2 - 85 / 2, 400);
			westButton.move(northButton.x - 85, northButton.y + 88);
			eastButton.move(northButton.x + 85 + 4, westButton.y);
			southButton.move(northButton.x, westButton.y + 88 + 4);
		}
		
		private function makeButton(direction:String):ArrowButton
		{
			var arrowButton:ArrowButton = new ArrowButton(direction);
			addChild(arrowButton);
			arrowButton.addEventListener(MouseEvent.MOUSE_DOWN, onStartMovingCharacter);
			arrowButton.addEventListener(MouseEvent.MOUSE_UP, onStopMovingCharacter);
			arrowButton.useHandCursor = true;
			arrowButton.buttonMode = true;
			return arrowButton;
		}
		
		private function onDeactivate(event:Event):void
		{
			NativeApplication.nativeApplication.exit();
		}
		
		private function onStartMovingCharacter(event:MouseEvent):void
		{
			var arrowButton:ArrowButton = event.target as ArrowButton;
			character.startMoving(arrowButton.direction);
		}
		
		private function onStopMovingCharacter(event:MouseEvent):void
		{
			character.stopMoving();
		}
	}
}