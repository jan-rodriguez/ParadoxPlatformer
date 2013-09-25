package 
{
	import net.flashpunk.World;
	
	
	public class theWorld extends World
	{
		public function theWorld()
		{
			var wg:WorldGenerator = new WorldGenerator(0,0);
			var worldRep:Array = wg.getGapLevel();
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
						case 3:
							add(new theGoal(x, y));
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