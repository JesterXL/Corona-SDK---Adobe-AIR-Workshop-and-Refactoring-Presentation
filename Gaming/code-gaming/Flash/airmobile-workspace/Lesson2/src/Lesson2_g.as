package
{
	import flash.display.Sprite;
	
	public class Lesson2_g extends Sprite
	{
		public function Lesson2_g()
		{
			super();
			
			// --------------------------------------------------------
			var truth:Boolean = true;
			if(truth == true)
			{
				trace("Supeeeerrrrrrrrr!");
			}
			
			// --------------------------------------------------------
			if(truth)
				trace("Supa shorthand!");
			
			// --------------------------------------------------------
			if(truth != false) trace("Supa dupah 1 liner!");
			
			// --------------------------------------------------------
			truth == true ? trace("Supa tern!") : trace("No good...");
			
			// --------------------------------------------------------
			if(truth == true)
			{
				trace("Great!");
			}
			else
			{
				trace("No good...");
			}
			
			// --------------------------------------------------------
			var score:int = 0;
			if(score <= 0)
			{
				trace("Zero.");
			}
			else if(score == 1)
			{
				trace("A start.");
			}
			else
			{
				trace("Rad, you're getting it.");
			}
			
			// --------------------------------------------------------
			switch(score)
			{
				case 0:
					trace("Zero");
					break;
				
				case 1:
					trace("A start.");
					break;
				
				case 2:
				case 3:
					trace("Rad, you're getting it.");
					break;
				
				default:
					trace("Keep going!");
					break;
			}
		}
	}
}