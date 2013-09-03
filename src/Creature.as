/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 4:52 PM
 */
package {
	import starling.display.Sprite;

	import utils.GridPosition;

	public class Creature extends Sprite
	{
		private var _gridPosition:GridPosition;

		public function Creature()
		{
			super();
			_gridPosition = new GridPosition();
		}

		public function get gridPosition():GridPosition
		{
			return _gridPosition;
		}

		public function set gridPosition(value:GridPosition):void
		{
			_gridPosition = value;
			x = _gridPosition.realX;
			y = _gridPosition.realY;
		}

		public function set gridPosX(value:int):void
		{
			_gridPosition.gridX = value;
			x = _gridPosition.realX;
		}

		public function set gridPosY(value:int):void
		{
			_gridPosition.gridY = value;
			y = _gridPosition.realY;
		}
	}
}
