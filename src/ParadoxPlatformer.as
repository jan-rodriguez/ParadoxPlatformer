package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class ParadoxPlatformer extends Engine
	{
		public function ParadoxPlatformer()
		{
			super(640,480,60,false);
		}
		override public function init():void {
			FP.screen.color = 0x222233;
			FP.world = new MainMenu();
		}
	}
}