package
{
	import com.jessewarden.examples.SupaBox;
	
	import flash.display.Sprite;
	
	public class Lesson2_o extends Sprite
	{
		private var box2:SupaBox;
		
		public function Lesson2_o()
		{
			super();
			
			var box1:SupaBox = new SupaBox(this, 100, 100);
			box1.x = 100;
			
			var box2:SupaBox = new SupaBox(this, 200, 200);
			box2.x = 100;
			box2.y = 120;
		}
	}
}