package
{
	public class WorldGenerator
	{
		private var worldRep:Array;
		
		public function WorldGenerator(sizeX:int, sizeY:int)
		{
			worldRep = createBaseLevelArray(sizeX,sizeY);
		}
		
		public function getDefaultLevel():Array
		{
			var defaultLevel:Array = createBaseLevelArray(20,14);
			for (var i:int = 0; i<20; i++) {
				defaultLevel[i][0] = 1;
				defaultLevel[i][14] = 1;
			}
			for (var i:int = 0; i<14; i++) {
				defaultLevel[0][i] = 1;
				defaultLevel[19][i] = 2;
			}
			for (var k:int = 1; k<5; k++) {
				defaultLevel[5-k][14-k] = 1;
				defaultLevel[9-k][9] = 1;
				defaultLevel[14+k][8-k] = 1;
				defaultLevel[9+k][8] = 1;
			}
			return defaultLevel;
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