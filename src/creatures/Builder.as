/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 4:52 PM
 */
package creatures
{
	import starling.display.Shape;
	import starling.events.Event;

	import utils.GridPosition;
	import utils.MathUtils;
	import utils.Vec2Const;

	public class Builder extends Creature
	{
		private const DIRECTION_CHANGE_CHANCE:Number = 0.3;
		private var _direction:Vec2Const;
		private var _speed:Number = 1;

		public function Builder()
		{
			super();
			init();
		}

		private function init():void
		{
			_direction = Vec2Const.DOWN;

			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xff00ff);
			shape.graphics.drawRect(0,0,20,20);
			shape.graphics.endFill();
			addChild(shape);
			shape.x -= shape.width/2;
			shape.y -= shape.height/2;
		}

		override public function update(e:Event):void
		{
			var travelPosX:int = this.x;
			var travelPosY:int = this.y;
			var nextVertex:GridPosition;
			var gridVertexPassed:Boolean = false;

			//move the sprite in the chosen direction
			if(_direction.equals(Vec2Const.UP))
			{
				travelPosY -= _speed;
				nextVertex = new GridPosition(_gridPosition.gridX, Math.max(_gridPosition.gridY - 1, 0));
				if(travelPosY <= nextVertex.realY)
				{
					gridVertexPassed = true;
				}
			}
			else if (_direction.equals(Vec2Const.DOWN))
			{
				travelPosY += _speed;
				nextVertex = new GridPosition(_gridPosition.gridX, Math.min(_gridPosition.gridY + 1, Constants.GRID_HEIGHT - 1));
				if(travelPosY >= nextVertex.realY)
				{
					gridVertexPassed = true;
				}
			}
			else if (_direction.equals(Vec2Const.RIGHT))
			{
				travelPosX += _speed;
				nextVertex = new GridPosition(Math.min(_gridPosition.gridX + 1, Constants.GRID_WIDTH - 1), _gridPosition.gridY);
				if(travelPosX >= nextVertex.realX)
				{
					gridVertexPassed = true;
				}
			}
			else if (_direction.equals(Vec2Const.LEFT))
			{
				travelPosX -= _speed;
				nextVertex = new GridPosition(Math.max(_gridPosition.gridX - 1, 0), _gridPosition.gridY);
				if(travelPosX <= nextVertex.realX)
				{
					gridVertexPassed = true;
				}
			}

			//if a grid vertex has been passed then link the vertices
			//small chance to change direction (switch vertical/horizontal movement)
			if(gridVertexPassed)
			{
				//link vertices if they are different
				if(!_gridPosition.equals(nextVertex))
				{
					Structure.getInstance().linkVertices(_gridPosition, nextVertex);
				}

				//set the position back to the last vertex reached to remain on the grid
				_gridPosition = nextVertex;
				this.x = _gridPosition.realX;
				this.y = _gridPosition.realY;


				if(MathUtils.randomRange(0,1) <= DIRECTION_CHANGE_CHANCE)
				{
					if(_direction.x == 0) //travelling vertically
					{
						if(MathUtils.randomBoolean())
						{
							_direction = Vec2Const.RIGHT;
						}
						else
						{
							_direction = Vec2Const.LEFT;
						}
					}
					else //travelling horizontally
					{
						if(MathUtils.randomBoolean())
						{
							_direction = Vec2Const.UP;
						}
						else
						{
							_direction = Vec2Const.DOWN;
						}
					}
				}
			}
			else
			{
				this.x = travelPosX;
				this.y = travelPosY;
			}

			//Create temporary line that follows builder
			var line:Shape = Structure.getInstance().tempVisual;
			line.graphics.clear();
			line.graphics.lineStyle(Structure.LINE_SIZE, Structure.LINE_COLOUR);
			line.graphics.moveTo(_gridPosition.realX, _gridPosition.realY);
			line.graphics.lineTo(this.x, this.y);
		}
	}
}