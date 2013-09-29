package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jan Rodriguez
	 */
	public class theSwitch extends Entity 
	{
		[Embed(source = '../assets/images/theswitch.png')] private const SWITCH:Class;
		public function theSwitch(posX:int, posY:int) 
		{
			graphic = new Image(SWITCH);
			setHitbox(25,12);
			type="switch";
			x=posX*32+8;
			y=posY*32+20;
		}
		
	}

}