package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		private var angle:int;
		private var xSpeed:Number=0;
		private var ySpeed:Number = 0;
		
		// Animated bullet sprites
		[Embed(source = '../assets/images/bullet.png')] private const BULLET_ANIM:Class;
		protected var bulletSprite:Spritemap = new Spritemap(BULLET_ANIM, 16, 16);
		
		public function Bullet( posX:int, posY:int, launchAngle:int = 0)
		{
			setHitbox(16,16);
			x = posX;
			y = posY;
			type = "bullet";
			
			xSpeed = Math.round(5 * Math.cos( launchAngle * Math.PI / 180 ));
			ySpeed = Math.round(5 * Math.sin( launchAngle * Math.PI / 180 ));
			
			// Animation code -Nick
			bulletSprite = new Spritemap(BULLET_ANIM, 16, 16);
			//bulletSprite.originX = 4;
			//bulletSprite.originY = 6;
			graphic = bulletSprite;
			bulletSprite.add("default", [0, 1, 2, 3], 24);
		}
		override public function update():void {
			adjustXPosition();
			adjustYPosition();
			//trace("bullet x:" + x + " bullet y: " + y);
			if (collide("wall", x , y) || collide("spikes", x , y) )
			{
				FP.world.remove(this);
			}
			bulletSprite.play("default");
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