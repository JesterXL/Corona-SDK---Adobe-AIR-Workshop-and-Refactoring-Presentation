package
{
	import flash.display.Sprite;
	
	public class Lesson2_l_m extends Sprite
	{
		public function Lesson2_l_m()
		{
			super();
			
			var name:String;
			var bool:Boolean;
			var num:Number;
			
			trace("name: " + typeof(name));
			//trace("name: " + instanceof(name));
			trace("name is String: " + name is String);
			
			trace("bool: " + typeof(bool));
			trace("bool is Boolean: " + bool is Boolean);
			
			trace("num: " + typeof(num));
			trace("num is Number: " + num is Number);
		}
	}
}