package com.jessewarden.examples
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	
	public class SupaBox extends Shape
	{
		public function SupaBox(parent:DisplayObjectContainer, w:Number, h:Number)
		{
			super();
			
			parent.addChild(this);
			
			graphics.lineStyle(0, 0x000000);
			graphics.beginFill(0xEEEEEE);
			graphics.drawRect(0, 0, w, h);
			graphics.endFill();
		}
	}
}