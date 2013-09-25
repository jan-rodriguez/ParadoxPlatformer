package
{
	/* The vision for this class is to use it as the base structure 
		for generating random levels. We can construct basic arrays
		that the WorldGenerator class can use read and fill in with
		random constructs. 
	*/
	public final class LevelStructure
	{
		/*
		 * Empty space = 0
		 * Wall = 1
		 * Player Start = 2
		 * Goal = 3
		 * Obstacle Type = 10-29
		 * Random Obstacle = >30 TODO: add random obstacles
		 */
		
		/*
		 * TODO: Make level reader read more human readable level orientation...
		 */
		public static const DEFAULT:Array = new Array(
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,0,0,0,0,0,0,0,0,0,1,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,1,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,1,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,1,1],
			[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,1,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,1,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,1,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,1,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,1,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,1,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,1,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,1,0,0,0,0,0,0,0,0,0,1],
			[10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]); 
		
		public static const levels:Array = new Array(DEFAULT);
		//public static const TUES:Array = new Array(); 
		
	}
}