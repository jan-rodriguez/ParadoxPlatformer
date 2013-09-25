package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Don Carlo
	 */
	public class theClone extends Entity
	{	
		private var path:Array = [];
		private var power:Number=0.4;
		private var jumpPower:Number=10;
		private var hFriction:Number=0.85;
		private var vFriction:Number=0.95;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var onTheGround:Boolean=false;
		private var gravity:Number = 0.45;
		private var myWorld:World;
		[Embed(source = '../assets/player.jpg')] private const PLAYER:Class;
		
		public function theClone(xPosition:int , yPosition:int, clonePath:Array)
		{
			graphic = new Image(PLAYER);
			setHitbox(16, 16);
			x = xPosition;
			y = yPosition;
			path = clonePath;
			type = "wall"; //TODO: This is a temporary assignment
			
		}
		
		override public function update():void 
		{
			var pressed:Boolean = false;
			// For now, just have clone trace each position in the clonePath
			if (path.length != 0) {
				x = path[0][0]
				y = path[0][1]
				//TODO: Add velocities later
				
				//Remove positions as clone moves
				path.shift();
			}
			
			if (collide("wall",x,y+1)) {
				onTheGround=true;
				ySpeed=0;
			} else {
				ySpeed+=gravity;
			}
			if (collide("spikes",x,y+1)) {
				x=32*16;
				y=(32*13)+16;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			xSpeed*=hFriction;
			ySpeed*=vFriction;
			adjustXPosition();
			adjustYPosition();
		}
		
		private function adjustXPosition():void {
			for (var i:int=0; i<Math.abs(xSpeed); i++) {
				if (! collide("wall",x+FP.sign(xSpeed),y)) {
					x+=FP.sign(xSpeed);
				} else {
					xSpeed=0;
					break;
				}
			}
		}
		
		private function adjustYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) {
				if (! collide("wall",x,y+FP.sign(ySpeed))) {
					y+=FP.sign(ySpeed);
				} else {
					ySpeed=0;
					break;
				}
			}
		}
	}

}