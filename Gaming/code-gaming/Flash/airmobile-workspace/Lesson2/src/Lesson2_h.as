package
{
	import flash.display.Sprite;
	
	public class Lesson2_h extends Sprite
	{
		public function Lesson2_h()
		{
			super();
			
			var first:String = "Marky";
			var second:String = "Mark";
			var combined:String = first + ", " + second;
			trace("combined: " + combined);
			trace("regular: ", first, ", ", second);
		}
	}
}