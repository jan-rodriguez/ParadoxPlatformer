package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class theTurret extends Entity
	{
		private var angle:int;
		private var rate:int;
		private var time:Number;
		[Embed(source='../assets/spikes.png')] private const OBSTACLE:Class;
		
		public function theTurret(posX:int, posY:int, turretAngle:int = 0, fireRate:int = 5)
		{
			trace("added turret");
			graphic = new Image(OBSTACLE);
			angle = turretAngle;
			rate = fireRate;
			
			setHitbox(32,32);
			type="turret";
			x=posX*32;
			y=posY*32;
			Image(this.graphic).angle = angle;
			Image(this.graphic).centerOrigin();
			time = 0;
		}
		override public function update():void
		{
			
			time += FP.elapsed;
			if ( time >= rate )
			{
				trace("update")
				time = 0;
				fire();
			}
		}
		private function fire():void
		{
			FP.world.add(new Bullet(x,y,angle));
			
		}
	}
}