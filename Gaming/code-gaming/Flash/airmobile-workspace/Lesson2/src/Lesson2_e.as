package
{
	import flash.display.Sprite;
	
	public class Lesson2_e extends Sprite
	{
		public function Lesson2_e()
		{
			super();
			
			var name:String = null;
			trace("---------");
			trace("name: " + name);
			name = "Cow";
			trace("name: " + name);
			name = null;
			trace("name: " + name);
			
			var value:Number;
			trace("---------");
			trace("value: " + value);
			value = 2;
			trace("value: " + value);
			value = null;
			trace("value: " + value);
			
			var num:Number = 0;
			trace("---------");
			trace("num: " + num);
			trace("isNaN: " + isNaN(num));
			num = NaN;
			trace("isNaN: " + isNaN(num));
			
			
			trace("---------");
			var truth:Boolean;
			trace("truth: " + truth);
			truth = true;
			trace("truth: " + truth);
			truth = null;
			trace("truth: " + truth);
			
			trace("---------");
			var list:Array = [1, 2, 3];
			trace("list: " + list);
			list = null;
			trace("list: " + list);
			list = ["1", "2", "3"];
			trace("list: " + list + ", len: " + list.length);
			list.length = 0;
			trace("list: " + list);
			
			trace("-------");
			var cow:Object;
			trace("cow: " + cow);
			trace("is undefined: " + (cow == undefined));
			trace("is null: " + (cow == null));
			trace("is TRULY undefined: " + (cow === undefined));
			trace("is TRULY null: " + (cow === null));
			
			trace("-------");
			trace("cheese: " + cheese);
			trace("is undefined: " + (cheese == undefined));
			trace("is null: " + (cheese == null));
			trace("is TRULY undefined: " + (cheese === undefined));
			trace("is TRULY null: " + (cheese === null));
			var cheese:Object;
			cheese = {};
			trace("cheese.name is TRULY undefined: " + (cheese.name === undefined));
			trace("cheese.name is TRULY null: " + (cheese.name === null));
			cheese.name = "Marky Mark";
			delete cheese.name;
			trace("cheese.name is TRULY undefined: " + (cheese.name === undefined));
			trace("cheese.name is TRULY null: " + (cheese.name === null));
			
		}
	}
}