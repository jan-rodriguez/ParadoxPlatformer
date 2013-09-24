package
{
	public class WorldGenerator
	{
		private var worldRep:Array;
		
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
		
		public function generateRandomLevel():Array
		{
			return null;
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