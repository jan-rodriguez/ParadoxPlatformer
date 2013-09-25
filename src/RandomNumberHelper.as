package
{
	public class RandomNumberHelper
	{
		public static function randomIntRange(start:Number, end:Number):int
		{
			return int(randomNumberRange(start, end));
		}
		
		public static function randomNumberRange(start:Number, end:Number):Number
		{
			end++;
			return Math.floor(start + (Math.random() * (end - start)));
		}
	}
}