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
		[Embed(source = '../assets/images/trailBlip.png')] private const REWIND:Class;
		var blipImage:Image = new Image(REWIND);
		public function theRewindEntity(xPosition:int , yPosition:int) 
		{
			graphic = blipImage;
			x = xPosition;
			y = yPosition;
			layer = 1500;
		}
		
		override public function update():void
		{
			blipImage.alpha -= 0.01;
		}
		
	}

}