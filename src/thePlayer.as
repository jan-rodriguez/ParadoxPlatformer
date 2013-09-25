package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class thePlayer extends Entity
	{
		private var playerPosition:Array = [];
		private var xPosition:int = 0; 
		private var yPosition:int = 1;
		private var previousX:int = 0;
		private var previousY:int = 0;
		private var rewindState:Boolean = false;
		
		private var power:Number=0.4;
		private var jumpPower:Number=10;
		private var hFriction:Number=0.85;
		private var vFriction:Number=0.95;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var onTheGround:Boolean=false;
		private var gravity:Number=0.45;
		[Embed(source='../assets/player.jpg')] private const PLAYER:Class;
		
		public function thePlayer(posX:int,posY:int)
		{
			graphic = new Image(PLAYER);
			setHitbox(16,16);
			x=32*posX;
			y=(32*posY)+16;
		}
		
		override public function update():void {
			var pressed:Boolean = false;

			// Add position to array after each update
			if (!Input.check(Key.SHIFT)) 
			{
				rewindState = false;
				if (x == previousX && y == previousY)
				{
				}
				else
				{
				playerPosition.push([x, y]);
				previousX = x; 
				previousY = y;
				}
			
				
				//trace([x, y]);
				
				if (rewindState == true) {
					//Set rewind state to false 
					rewindState = false;
					
					//Add new entity to world 
					
				
				}
				
			}
			
			if (Input.check(Key.SHIFT)) {
				rewindState = true;
				//Move back to most recent position
				if (playerPosition.length != 0){
				x = playerPosition[playerPosition.length - 1][xPosition];
				y = playerPosition[playerPosition.length - 1][yPosition];
				
				//Remove most recent position from array
				playerPosition.pop();
				}
			}
			
			if (Input.check(Key.LEFT)) {
				xSpeed-=power;
				pressed=true;
			}
			if (Input.check(Key.RIGHT)) {
				xSpeed+=power;
				pressed=true;
			}
			if (collide("wall",x,y+1)) {
				onTheGround=true;
				ySpeed=0;
				if (Input.check(Key.UP)) {
					ySpeed-=jumpPower;
				}
			} else {
				ySpeed+=gravity;
			}
			if (collide("spikes",x,y+1)) {
				x=32*16;
				y=(32*13)+16;
			} else if (collide("goal", x, y + 1)) {
				x = 32;
				y = 32;
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