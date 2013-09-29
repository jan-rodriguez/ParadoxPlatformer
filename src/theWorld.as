package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	public class theWorld extends World
	{
		//obstacle types
		public static const GOAL:int = 3;
		public static const SPIKES:int = 10;
		public static const RIGHT_TURRET:int = 11;
		public static const LEFT_TURRET:int = 12;
		public static const UP_TURRET:int = 13;
		public static const DOWN_TURRET:int = 14;
		
		
		private var wg:WorldGenerator;
		private var level:Array;
		
		public function theWorld()
		{
			wg = new WorldGenerator(0,0);
			createWorld();
		}
		private function createWorld()
		{
			level = wg.generateRandomLevel();
			generateWorld(level);
		}
		override public function update():void
		{
			if(Input.pressed(Key.P))
			{
				FP.world = new PauseMenu(this);
			}
			else
			{
				super.update();
			}
		}
		public function reset()
		{
			trace("reseting world");
			removeAll();
			createWorld();
		}
		public function restart()
		{
			trace("restarting level");
			removeAll();
			regenerate();
		}
		private function regenerate()
		{
			removeAll();
			generateWorld(level);
		}
		private function generateWorld(worldRep:Array)
		{
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
						case GOAL:
							add(new theGoal(x, y));
							break;
						case RIGHT_TURRET:
							add(new theTurret(x,y));
							break;
						case LEFT_TURRET:
							add(new theTurret(x,y, 180));
							break;
						case DOWN_TURRET:
							add(new theTurret(x,y, 270));
							break;
						case UP_TURRET:
							add(new theTurret(x,y, 90));
							break;
						default:
							break;
					}
				}
			}
			add(new TimeBar());
		}
	}
}