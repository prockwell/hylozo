/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-03
 * Time: 12:32 PM
 */
package utils
{
	public class GridPosition
	{
		private var _gridX:int;
		private var _gridY:int;

		public function GridPosition(gridX:int = 0 , gridY:int = 0)
		{
			_gridX = gridX;
			_gridY = gridY;
		}

		public function get gridX():int
		{
			return _gridX;
		}

		public function set gridX(value:int):void
		{
			_gridX = value;
		}

		public function get gridY():int
		{
			return _gridY;
		}

		public function set gridY(value:int):void
		{
			_gridY = value;
		}

		public function get realX():int
		{
			return _gridX * Constants.GRID_BLOCK_SIZE;
		}

		public function get realY():int
		{
			return _gridY * Constants.GRID_BLOCK_SIZE;
		}
	}
}
