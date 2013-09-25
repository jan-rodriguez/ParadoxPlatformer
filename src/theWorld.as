package 
{
	import net.flashpunk.World;
	
	
	public class theWorld extends World
	{
		//obstacle types
		public static const SPIKES:int = 10;
		private var wg:WorldGenerator;
		
		public function theWorld()
		{
			wg = new WorldGenerator(0,0);
			createWorld();
		}
		private function createWorld()
		{
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
						case 2:
							add(new thePlayer(x, y, this));
							break;
						case SPIKES:
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
			//add(new thePlayer(this));
		}
		public function reset()
		{
			trace("reseting world");
			removeAll();
			createWorld();
		}
	}
}