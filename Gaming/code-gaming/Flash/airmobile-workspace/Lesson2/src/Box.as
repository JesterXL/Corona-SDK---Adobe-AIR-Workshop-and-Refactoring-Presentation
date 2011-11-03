package
{
	import flash.display.Shape;
	
	public class Box extends Shape
	{
		public function Box()
		{
			super();
			
			graphics.lineStyle(2, 0xFF0000);
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, 50, 50);
			graphics.endFill();
		}
		
		
	}
}