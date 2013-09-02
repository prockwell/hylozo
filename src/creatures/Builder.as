/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 4:52 PM
 */
package creatures
{
	import starling.display.Shape;

	public class Builder extends Creature
	{
		public function Builder()
		{
			super();
			init();

		}

		private function init():void
		{
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xff00ff);
			shape.graphics.drawRect(0,0,20,20);
			shape.graphics.endFill();
			addChild(shape);
			shape.x -= shape.width/2;
			shape.y -= shape.height/2;
		}
	}
}