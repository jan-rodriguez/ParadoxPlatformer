package 
{
	import flash.utils.ByteArray;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
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
		
		private var finalLevel:Boolean = false;
		private var wg:WorldGenerator;
		private var level:Array;
		
		[Embed(source = '../assets/music/snappy_lo.mp3')] private static const LEVELMUSIC:Class;
		public static var sfxLevelMusic:Sfx = new Sfx(LEVELMUSIC); 
		
		// Level background
		[Embed(source='../assets/images/background.png')] private const BACKGROUND:Class;
		
		public function theWorld()
		{
			LevelStructure.levels = clone(LevelStructure.ALL_LEVELS);
			wg = new WorldGenerator(0, 0);
			sfxLevelMusic.loop();
			createWorld();
		}
		private function createWorld():void
		{
			addGraphic(new Image(BACKGROUND), 2000, 0, 0);

			if (finalLevel)
			{
				FP.world = new WinningScreen();
			}
			else if (LevelStructure.getNumLevels())
			{
				level = wg.generateRandomLevel();
				generateWorld(level);
			}
			else
			{
				finalLevel = true;
				generateWorld(LevelStructure.FINALLEVEL);
			}
		}
		override public function update():void
		{
			if(Input.pressed(Key.P))
			{
				FP.world = new PauseMenu(this);
			}
			else
			{
				if (Input.check(Key.SHIFT)) {
					sfxLevelMusic.volume = 0.2;
				}
				else {
					sfxLevelMusic.volume = 1;
				}
				
				super.update();
			}
		}
		public function reset():void
		{
			trace("reseting world");
			removeAll();
			createWorld();
		}
		public function restart():void
		{
			trace("restarting level");
			removeAll();
			regenerate();
		}
		private function regenerate():void
		{
			removeAll();
			generateWorld(level);
		}
		private function generateWorld(worldRep:Array):void
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
			add(new TimeBar());
		}
		
		public function clone(source:Object):* 
		{ 
			var myBA:ByteArray = new ByteArray(); 
			myBA.writeObject(source); 
			myBA.position = 0; 
			return(myBA.readObject()); 
		}
	}
}