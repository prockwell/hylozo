/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 4:52 PM
 */
package {
	import starling.display.Sprite;

	public class Creature extends Sprite
	{
		protected var _gridPosX:int;
		protected var _gridPosY:int;

		public function Creature()
		{
			super();
		}

		public function get gridPosX():int
		{
			return _gridPosX;
		}

		public function set gridPosX(value:int):void
		{
			_gridPosX = value;
			x = Landscape.getRealPos(value);
		}

		public function get gridPosY():int
		{
			return _gridPosY;
		}

		public function set gridPosY(value:int):void
		{
			_gridPosY = value;
			y = Landscape.getRealPos(value);
		}
	}
}
