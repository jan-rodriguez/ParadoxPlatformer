package 
{
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	
	
	public class theWorld extends World
	{
		//obstacle types
		public static const GOAL:int = 3;
		public static const SWITCH:int = 5;
		public static const SPIKES:int = 10;
		public static const RIGHT_TURRET:int = 11;
		public static const LEFT_TURRET:int = 12;
		public static const UP_TURRET:int = 13;
		public static const DOWN_TURRET:int = 14;
		
		
		private var wg:WorldGenerator;
		
		[Embed(source = '../assets/music/epic_background.mp3')] private const LEVELMUSIC:Class;
		private var sfxLevelMusic:Sfx = new Sfx(LEVELMUSIC); 
		
		public function theWorld()
		{
			wg = new WorldGenerator(0, 0);
			sfxLevelMusic.loop();
			createWorld();
		}
		private function createWorld():void
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
						case SWITCH:
							add(new theSwitch(x, y));
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
			//add(new thePlayer(this));
		}
		public function reset():void
		{
			trace("reseting world");
			removeAll();
			createWorld();
		}
	}
}