/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-03
 * Time: 2:28 PM
 */
package
{
	import starling.display.Shape;
	import starling.display.Sprite;

	import utils.GridPosition;

	public class Structure extends Sprite
	{
		private static var _instance:Structure;
		private var _gridPoints:Vector.<GridPosition>;
		private var _visual:Shape;

		public function Structure()
		{
			_gridPoints = new Vector.<GridPosition>();
			_visual = new Shape();
			addChild(_visual);
		}

		public static function getInstance():Structure
		{
			if (_instance == null)
			{
				_instance = new Structure();
			}
			return _instance;
		}

		public function addPoint(point:GridPosition):void
		{
			_gridPoints.push(point);

			//if the initial point has been set then begin connecting them in sequence
			if(_gridPoints.length > 1)
			{
				var previousPoint:GridPosition = _gridPoints[_gridPoints.length - 2];
				_visual.graphics.lineStyle(2,0xffffff);
				_visual.graphics.moveTo(previousPoint.realX, previousPoint.realY);
				_visual.graphics.lineTo(point.realX, point.realY);
			}
		}
	}
}
