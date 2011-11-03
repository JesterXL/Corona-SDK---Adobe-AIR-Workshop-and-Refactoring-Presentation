package
{
	import com.jessewarden.sprites.Character;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Lesson4_a_TestingSpriteSheet extends Sprite
	{
		private var character:Character;
		
		public function Lesson4_a_TestingSpriteSheet()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			character = new Character();
			addChild(character);
			character.init();
			character.x = 100;
			character.y = 100;
		}
	}
}