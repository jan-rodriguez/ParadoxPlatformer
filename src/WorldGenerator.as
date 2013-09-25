package
{	
	import flash.utils.Dictionary;

	public class WorldGenerator
	{
		private var worldRep:Array;
		
		//this variable represents the number of random obstacles we have
		private var randomRange:int = 1;
		
		public function WorldGenerator(sizeX:int, sizeY:int, rep:Array = null)
		{
			worldRep = createBaseLevelArray(sizeX,sizeY);
			if (rep != null)
			{
				worldRep = rep;
			}
		}
		
		public function getDefaultLevel():Array
		{
			return LevelStructure.DEFAULT;
		}
		
		public function getGapLevel():Array
		{
			return LevelStructure.GAPLEVEL;
		}
		
		public function generateRandomLevel():Array
		{
			var dic = new Dictionary();
			var randomLevelNum = RandomNumberHelper.randomIntRange(0,LevelStructure.numLevels);
			var array:Array = LevelStructure.levels[randomLevelNum];
			for (var x:int = 0; x < array.length; x++)
			{
				for (var y:int = 0; y < array[x].length; y++)
				{
					if (array[x][y] >= 30)
					{
						if (dic[array[x][y]])
						{
							array[x][y] = dic[array[x][y]]
						}
						else
						{
							//get random obstacle
							dic[array[x][y]] = RandomNumberHelper.randomIntRange(10,11);
						}
					}
				}
			}
			return array;
		}
		
		public function getWorldRepresentation():Array
		{
			return worldRep;
		}
		public function createBaseLevelArray(sizeX:int, sizeY:int):Array
		{
			var array:Array = new Array(sizeX);
			for (var x:int = 0; x < array.length; x++)
			{
				array[x] = new Array(sizeY);
				for (var y:int = 0; y < array[x].length; y++)
				{
					array[x][y] = 0;
				}
			}
			return array;
		}
	}
}