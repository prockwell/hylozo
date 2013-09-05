/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-03
 * Time: 5:54 PM
 */
package utils
{
	public class GridVertex
	{
		public var upLink:Boolean;
		public var downLink:Boolean;
		public var leftLink:Boolean;
		public var rightLink:Boolean;

		public function GridVertex()
		{
			upLink = false;
			downLink = false;
			leftLink = false;
			rightLink = false;
		}
	}
}
