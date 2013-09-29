package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class theSpikes extends Entity
	{
		[Embed(source='../assets/images/spikes.png')] private const OBSTACLE:Class;
		public function theSpikes(posX:int,posY:int)
		{
			graphic = new Image(OBSTACLE);
			setHitbox(32,32);
			type="spikes";
			x=posX*32;
			y=posY*32;
		}
	}
}