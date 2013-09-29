package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class PauseMenu extends World
	{
		private var worldState:theWorld;
		public function PauseMenu(world:theWorld)
		{
			worldState = world;
			
			var titleText:Text = new Text("Use the arrow keys to move and jump\n\n " +
				"Press shift to rewind time and create a clone of yourself. " +
				"\n(Hint: the longer you hold it down the more you travel back in time.)" +
				"\n\nPress P to unpause." +
				"\n\nPress N to return to main menu." +
				"\n\nPress R to restart the current level.");
			var textEntity:Entity = new Entity(0,0,titleText);
			textEntity.x = (FP.width/2)-(titleText.width/2);
			textEntity.y = (FP.height/2)-(titleText.height/2);
			add(textEntity);
			var splashText:Text = new Text("Game Paused",0,0);
			splashText.color = 0x00ff00;
			splashText.size = 32;
			var splashEntity:Entity = new Entity(0,0,splashText);
			splashEntity.x = (FP.width/2)-(splashText.width/2);
			splashEntity.y = 100;
			add(splashEntity);
		}
		override public function update():void {
			if (Input.pressed(Key.P)) {
				FP.world = worldState;
			}
			if (Input.pressed(Key.N))
			{
				theWorld.sfxLevelMusic.stop();
				FP.world = new MainMenu(false);
			}
			if (Input.pressed(Key.R))
			{
				MainMenu.sfxBackground.stop();	
				FP.world = worldState;
				worldState.restart();
			}
		}
	}
}