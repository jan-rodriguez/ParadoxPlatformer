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
			for (var j:int = 0; j<14; j++) {
				add(new theWall(0,j));
				add(new theWall(19,j));
			}
			for (var z:int = 1; z<5; z++) {
				add(new theWall(5-z,14-z));
				add(new theWall(9-z, 9));
				add(new theWall(14+z,8-z));
				add(new theWall(9+z,8));
			}
			add(new thePlayer());
		}
	}
}