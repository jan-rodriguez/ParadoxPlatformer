package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class TimeBar extends Entity
	{
		public var bar:Image = Image.createRect(200, 16, 0xFF0000);
		public var rechargeText:Text = new Text("Recharging");
		public static var time:Number;
		public static const FLASHING_RATE:Number = .7
		
		public function TimeBar()
		{
			super(0, 0, bar);
			time = 0;
			var rechargeTextEntity:Entity = new Entity(200,0,rechargeText);
			rechargeText.visible = true;
			FP.world.add(rechargeTextEntity);
			bar.clipRect.width = 200;
		}
		
		override public function update():void
		{
			time += FP.elapsed;
			bar.clipRect.width = 200 * ((thePlayer.TIME_WARP_LIMIT - thePlayer.time)/thePlayer.TIME_WARP_LIMIT)
			if (bar.clipRect.width > 0  && time > FLASHING_RATE)
			{
				time = 0;
				rechargeText.visible = !rechargeText.visible; 
			}
			else if (bar.clipRect.width < 1)
			{
				rechargeText.visible = false;
			}
			bar.clear();
			bar.updateBuffer();
			rechargeText.clear();
			rechargeText.updateBuffer();
		}
	}
}