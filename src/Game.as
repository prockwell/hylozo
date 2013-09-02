/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 3:01 PM
 */
package
{
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite
	{
		public function Game()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(e:Event):void
		{
			var _shape:Shape = new Shape();
			addChild(_shape);

			_shape.graphics.beginFill(0xffffff);
			_shape.graphics.drawCircle(0,0, 20)
			_shape.graphics.endFill();

			_shape.x = stage.stageWidth/2;
			_shape.y = stage.stageHeight/2;
		}
	}
}
