package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		private var angle:int;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		[Embed(source = '../assets/player.jpg')] private const BULLET:Class;
		
		public function Bullet( posX:int, posY:int, launchAngle:int = 0)
		{
			setHitbox(16,16);
			graphic = new Image(BULLET);
			x = posX;
			y = posY;
			type = "bullet";
			
			xSpeed = Math.round(5 * Math.cos( launchAngle * Math.PI / 180 ));
			ySpeed = Math.round(5 * Math.sin( launchAngle * Math.PI / 180 ));
		}
		override public function update():void {
			adjustXPosition();
			adjustYPosition();
			//trace("bullet x:" + x + " bullet y: " + y);
			if (collide("wall", x , y) || collide("spikes", x , y) )
			{
				FP.world.remove(this);
			}
		}
		
		private function adjustXPosition():void {
			for (var i:int=0; i<Math.abs(xSpeed); i++) {
				x+=FP.sign(xSpeed);
			}
		}
		
		private function adjustYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) {
				y+=FP.sign(ySpeed);
			}
		}
	}
}