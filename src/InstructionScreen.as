package
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;

	public class InstructionScreen extends World
	{
		public function InstructionScreen() {
			var titleText:Text = new Text("Use the arrow keys to move and jump\n\n Press shift to rewind time and create a clone of yourself. \n(Hint: the longer you hold it down the more you travel back in time.)");
			var textEntity:Entity = new Entity(0,0,titleText);
			textEntity.x = (FP.width/2)-(titleText.width/2);
			textEntity.y = (FP.height/2)-(titleText.height/2);
			add(textEntity);
			var splashText:Text = new Text("Paradox Platformer",0,0);
			splashText.color = 0x00ff00;
			splashText.size = 32;
			var splashEntity:Entity = new Entity(0,0,splashText);
			splashEntity.x = (FP.width/2)-(splashText.width/2);
			splashEntity.y = 100;
			add(splashEntity);
		}
		override public function update():void {
			if (Input.mouseReleased) {
				FP.screen.color = 0x222233;
				FP.world=new theWorld();
			}
		}
	}
}