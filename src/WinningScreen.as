package {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	public class WinningScreen extends World {
		
		[Embed(source = '../assets/music/start_up_screen_loop.mp3')] private static const BACKGROUNDMUSIC:Class;
		public static var sfxBackground:Sfx = new Sfx(BACKGROUNDMUSIC);
		
		private static var firstTime:Boolean = true;
		
		public function WinningScreen(first:Boolean = true) {
			firstTime = first;
			sfxBackground.loop();
			var titleText:Text = new Text("Click to go back to the main menu!");
			var textEntity:Entity = new Entity(0,0,titleText);
			textEntity.x = (FP.width/2)-(titleText.width/2);
			textEntity.y = (FP.height/2)-(titleText.height/2);
			add(textEntity);
			var splashText:Text = new Text("You Win!",0,0);
			splashText.color = 0x00ff00;
			splashText.size = 32;
			var splashEntity:Entity = new Entity(0,0,splashText);
			splashEntity.x = (FP.width/2)-(splashText.width/2);
			splashEntity.y = 100;
			add(splashEntity);
		}
		override public function update():void {
			if (Input.mouseReleased) {
				sfxBackground.stop();
				FP.screen.color = 0x222233;
				FP.world=new MainMenu();	
			}
		}
	}
}