package 
{
	import net.flashpunk.World;
	
	
	public class theWorld extends World
	{
		//obstacle types
		public static const SPIKES:int = 10;
		
		public function theWorld()
		{
			var wg:WorldGenerator = new WorldGenerator(0,0);
			var worldRep:Array = wg.generateRandomLevel();
			trace(worldRep);
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
						case SPIKES:
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