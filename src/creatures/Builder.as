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

	public class Builder extends Creature
	{
		private var _destination:GridPosition;
		private var _speed:Number = 3.5;
		private var _line:Shape;

		public function Builder()
		{
			super();
			init();
		}

		private function init():void
		{
			_line = new Shape();
			addChild(_line);

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
			//if no destination exists then create a new one
			if(!_destination)
			{
				_destination = new GridPosition();
				if(MathUtils.randomBoolean())
				{
					//move on X axis
					_destination.gridX = MathUtils.randomRangeInt(0, Constants.GRID_WIDTH - 1);
					_destination.gridY = _gridPosition.gridY;
				}
				else
				{
					//move on Y axis
					_destination.gridY = MathUtils.randomRangeInt(0, Constants.GRID_HEIGHT - 1);
					_destination.gridX = _gridPosition.gridX;
				}
			}

			//move toward destination
			var travel:Number;
			if(_destination.realX != this.x)
			{
				if (_destination.realX > this.x)
				{
					travel = Math.min(this.x + _speed, _destination.realX);
				}
				else
				{
					travel = Math.max(this.x - _speed, _destination.realX);
				}
				this.x = travel;
			}
			else if (_destination.realY != this.y)
			{
				if (_destination.realY > this.y)
				{
					travel = Math.min(this.y + _speed, _destination.realY);
				}
				else
				{
					travel = Math.max(this.y - _speed, _destination.realY);
				}
				this.y = travel;
			}
			else
			{
				onDestinationReached();
			}

			//create line from previous position

			//TODO line creation needs to be fixed (non-local)
			_line.graphics.clear();
			_line.graphics.lineStyle(2,0xffffff);
			_line.graphics.moveTo(_gridPosition.realX, _gridPosition.realY);
			_line.graphics.lineTo(this.x, this.y);
		}

		private function onDestinationReached():void
		{
			_gridPosition = _destination;
			Structure.getInstance().addPoint(_gridPosition);
			_destination = null;
		}
	}
}