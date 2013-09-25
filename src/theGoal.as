package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * Goal class used to represent the goal for the game
	 */
	public class theGoal extends Entity 
	{
		[Embed(source='../assets/greensquare.jpg')] private const GOAL:Class;
		public function theGoal(posX:int, posY:int) 
		{
			graphic = new Image(GOAL);
			setHitbox(32,32);
			type="goal";
			x=posX*32;
			y=posY*32;
		}
		
	}

}