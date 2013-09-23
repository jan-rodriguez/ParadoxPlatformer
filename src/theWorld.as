package 
{
	import net.flashpunk.World;
	
	
	public class theWorld extends World
	{
		public function theWorld()
		{
			for (var i:int = 0; i<20; i++) {
				add(new theWall(i,0));
				add(new theWall(i,14));
			}
			for (var i:int = 0; i<14; i++) {
				add(new theWall(0,i));
				add(new theSpikes(19,i));
			}
			for (var i:int = 1; i<5; i++) {
				add(new theWall(5-i,14-i));
				add(new theWall(9-i, 9));
				add(new theWall(14+i,8-i));
				add(new theWall(9+i,8));
			}
			add(new thePlayer());
		}
	}
}