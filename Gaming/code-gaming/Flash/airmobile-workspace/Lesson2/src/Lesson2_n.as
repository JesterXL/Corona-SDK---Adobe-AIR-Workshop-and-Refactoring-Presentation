package
{
	import flash.display.Sprite;
	
	public class Lesson2_n extends Sprite
	{
		
		private var box2:Box;
		private var box3:Box = new Box();
		
		public function Lesson2_n()
		{
			super();
			
			var box1:Box = new Box();
			addChild(box1);
			box1.x = 100;
			box1.y = 100;
			
			box2 = new Box();
			addChild(box2);
			box2.x = 100;
			box2.y = 160;
			
			addChild(box3);
			box3.x = 100;
			box3.y = 220;
		}
	}
}