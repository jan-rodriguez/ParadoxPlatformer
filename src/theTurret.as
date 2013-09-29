package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class theTurret extends Entity
	{
		private var angle:int;
		private var rate:int;
		private var time:Number;
		[Embed(source = '../assets/images/turret.png')] private const OBSTACLE:Class;
		
		[Embed(source = '../assets/soundfx/lazer.mp3')] private const LAZERSHOT:Class;
		private const sfxLazerShot:Sfx = new Sfx(LAZERSHOT);
		
		public function theTurret(posX:int, posY:int, turretAngle:int = 0, fireRate:int = 5)
		{
			graphic = new Image(OBSTACLE);
			angle = turretAngle;
			rate = fireRate;
			
			setHitbox(32,32);
			type="turret";
			x=posX*32-16;
			y=posY*32-16;
			Image(this.graphic).angle = angle;
			Image(this.graphic).centerOrigin();
			time = 0;
		}
		override public function update():void
		{
			
			time += FP.elapsed;
			if ( time >= rate )
			{
				time = 0;
				fire();
			}
		}
		private function fire():void
		{
			sfxLazerShot.play();
			FP.world.add(new Bullet(x,y,angle));
			
		}
	}
}