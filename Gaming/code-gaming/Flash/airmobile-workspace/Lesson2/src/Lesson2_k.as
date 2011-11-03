package
{
	import flash.display.Sprite;
	
	public class Lesson2_k extends Sprite
	{
		public function Lesson2_k()
		{
			super();
			
			sayHello();
			
			whoAmI();
			
			var result:Number = add(1, 2);
			trace("result should be 3: " + result);
			
			var list:Array = ["James Wong", "Erica Priest", "Zahara Fahul", "Princess Pei Pei"];
			var closure:Function = function(obj:Object, index:int, array:Array):Boolean
			{
				var string:String = obj as String;
				var tempList:Array = string.split(" ");
				return tempList.length > 2;
			};
			var has3Name:Boolean = list.some(closure);
			trace("has a 3 name person: " + has3Name);
			
		}
		
		private function sayHello():void
		{
			trace("Hello!");
		}
		
		private function whoAmI():void
		{
			trace("this: " + this);
		}
		
		private function add(first:Number, second:Number):Number
		{
			return first + second;
		}
		
		
	}
}