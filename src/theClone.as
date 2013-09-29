package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
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
		// Dox sprites (for animation) and other variables for animation
		[Embed(source = '../assets/images/doxClone.png')] private const CLONE_ANIM:Class;
		protected var cloneSprite:Spritemap = new Spritemap(CLONE_ANIM, 26, 30);
		private var flipped:Boolean = false; // default facing is right
		
		public static var numClones:int = 0;
		
		public function theClone(xPosition:int , yPosition:int, clonePath:Array)
		{
			setHitbox(16, 24);
			x = xPosition;
			y = yPosition;
			path = clonePath;
			type = "wall"; //TODO: This is a temporary assignment
			
			// Draw order
			numClones++;
			layer = numClones;
			
			// Animation code -Nick
			cloneSprite = new Spritemap(CLONE_ANIM, 26, 30);
			cloneSprite.originX = 4;
			cloneSprite.originY = 6;
			cloneSprite.color = 0xFFFFFF;
			cloneSprite.tintMode = Image.TINTING_COLORIZE;
			cloneSprite.tinting = 0.05 * numClones;
			graphic = cloneSprite;
			cloneSprite.add("idle", [0], 24);
			cloneSprite.add("jumping", [1], 24);
			cloneSprite.add("running", [2, 3, 4, 5, 6, 7], 16);
			
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
				onTheGround=true;
				ySpeed=0;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			xSpeed*=hFriction;
			ySpeed*=vFriction;
			adjustXPosition();
			adjustYPosition();
			
			// Animation code -Nick
			cloneSprite.flipped = flipped;
			if (!onTheGround) {
				cloneSprite.play("jumping");
			}
			else if (xSpeed > 1) {
				cloneSprite.play("running");
			}
			else {
				cloneSprite.play("idle");
			}
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