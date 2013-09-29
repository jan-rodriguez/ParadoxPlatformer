package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Don Carlo
	 */
	public class theRewindEntity extends Entity
	{
		[Embed(source = '../assets/player.jpg')] private const REWIND:Class;
		public function theRewindEntity(xPosition:int , yPosition:int) 
		{
			graphic = new Image(REWIND);
			x = xPosition;
			y = yPosition;
		}
		
		override public function update():void
		{
			
		}
		
	}

}