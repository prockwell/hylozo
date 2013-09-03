/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-03
 * Time: 1:34 PM
 */
package utils
{
	public class MathUtils
	{
		public static function randomBoolean():Boolean
		{
			return Boolean( Math.round(Math.random()) );
		}

		public static function randomRange(min:Number, max:Number, round:Boolean = false):Number
		{
			var num:Number = (min + Math.random() * (max - min));

			if (round) return Math.round(num);
			return num;
		}

		public static function randomRangeInt(min:Number, max:Number):int
		{
			min = Math.ceil(min);
			max = Math.floor(max);
			return min + Math.floor(Math.random() * (max + 1 - min));
		}
	}
}
