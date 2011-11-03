package
{
	import flash.display.Sprite;
	
	public class Lesson2_d extends Sprite
	{
		private var foo:String = "moo";
		
		public function Lesson2_d()
		{
			super();
			
			trace("foo: " + foo);
			var foo:String = "bar";
			trace("foo: " + foo);
			trace("this.foo: " + this.foo);
		}
	}
}