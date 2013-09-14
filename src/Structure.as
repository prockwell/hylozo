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
	import utils.GridVertex;

	public class Structure extends Sprite
	{
		private static var _instance:Structure;
		private var _vertices:Vector.<Vector.<GridVertex>>;
		private var _visual:Shape;
		public var tempVisual:Shape;

		//line properties
		public static const LINE_SIZE:Number = 1;
		public static const LINE_COLOUR:int = 0xFFFFFF;

		public static function getInstance():Structure
		{
			if (_instance == null)
			{
				_instance = new Structure();
			}
			return _instance;
		}

		public function Structure()
		{
			//create 2d-array of vertices
			_vertices = new Vector.<Vector.<GridVertex>>();

			for (var i:int = 0; i < Constants.GRID_WIDTH; i++)
			{
				var dimension:Vector.<GridVertex> = new Vector.<GridVertex>();

				for (var j:int = 0; j < Constants.GRID_HEIGHT; j++)
				{
					var vertex:GridVertex = new GridVertex();
					dimension.push(vertex);
				}
				_vertices.push(dimension);
			}

			_visual = new Shape();
			addChild(_visual);

			tempVisual = new Shape();
			addChild(tempVisual);
		}

		public function linkVertices(point1:GridPosition, point2:GridPosition):void
		{
			if(point1.gridX != point2.gridX)
			{
				if(point1.gridX > point2.gridX)
				{
					if(_vertices[point1.gridX][ point1.gridY].leftLink)
					{
						return; //link already exists
					}
					_vertices[point1.gridX][ point1.gridY].leftLink = true;
					_vertices[point2.gridX][ point2.gridY].rightLink = true;
				}
				else
				{
					if(_vertices[point1.gridX][ point1.gridY].rightLink)
					{
						return;
					}
					_vertices[point1.gridX][ point1.gridY].rightLink = true;
					_vertices[point2.gridX][ point2.gridY].leftLink = true;
				}
			}
			else if (point1.gridY != point2.gridY)
			{
				if(point1.gridY > point2.gridY)
				{
					if(_vertices[point1.gridX][ point1.gridY].downLink)
					{
						return;
					}
					_vertices[point1.gridX][ point1.gridY].downLink = true;
					_vertices[point2.gridX][ point2.gridY].upLink = true;
				}
				else
				{
					if(_vertices[point1.gridX][ point1.gridY].upLink)
					{
						return;
					}
					_vertices[point1.gridX][ point1.gridY].upLink = true;
					_vertices[point2.gridX][ point2.gridY].downLink = true;
				}
			}
			else
			{
				trace("STRUCTURE: link vertices are the same. ")
				return;
			}

			//update link visual
			_visual.graphics.lineStyle(LINE_SIZE,LINE_COLOUR);
			_visual.graphics.moveTo(point1.realX, point1.realY);
			_visual.graphics.lineTo(point2.realX, point2.realY);
		}
	}
}
