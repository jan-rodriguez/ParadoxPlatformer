package {
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	public class MainMenu extends World {
		private static var firstTime = true;
		
		public function MainMenu() {
			var titleText:Text = new Text("Click to Start!");
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
				if ( firstTime )
				{
					FP.screen.color = 0x222233;
					FP.world=new InstructionScreen();	
				}
				else
				{
					FP.screen.color = 0x222233;
					FP.world=new InstructionScreen();	
				}
			}
		}
	}
}