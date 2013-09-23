package 
{
	import net.flashpunk.World;
	
	
	public class theWorld extends World
	{
		public function theWorld()
		{
			var wg:WorldGenerator = new WorldGenerator(0,0);
			var worldRep:Array = wg.getDefaultLevel();
			//trace(worldRep);
			/*for (var i:int = 0; i<20; i++) {
				add(new theWall(i,0));
				add(new theWall(i,14));
			}
			for (var i:int = 0; i<14; i++) {
				add(new theWall(0,i));
				add(new theSpikes(19,i));
			}
			for (var k:int = 1; k<5; k++) {
				add(new theWall(5-k,14-k));
				add(new theWall(9-k, 9));
				add(new theWall(14+k,8-k));
				add(new theWall(9+k,8));
			}*/
			for (var x:int = 0; x < worldRep.length; x++)
			{
				for (var y:int = 0; y < worldRep[x].length; y++)
				{
					var cellType:int = worldRep[x][y];
					switch(cellType)
					{
						case 1: 
							add(new theWall(x,y));
							break;
						case 2:
							add(new theSpikes(x,y));
							break;
						default: 
							break;
					}
				}
			}
			
			
			add(new thePlayer(16,13));
		}
	}
}