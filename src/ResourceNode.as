/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-14
 * Time: 4:48 PM
 */
package
{
	import com.greensock.TweenLite;

	import starling.display.Shape;
	import starling.display.Sprite;

	public class ResourceNode extends Sprite
	{
		private var _visual:Shape;
		private const COLLECT_TIME:Number = 0.3;

		public function ResourceNode()
		{
			draw();
		}

		public function draw():void
		{
			//draw visual
			_visual = new Shape();
			_visual.graphics.beginFill(0x00FF00);
			_visual.graphics.drawRect(0, 0, 3, 5);
			_visual.graphics.endFill();
			this.addChild(_visual);
			_visual.x = -_visual.width/2;
			_visual.y = -_visual.height/2;
		}

		public function collect(creature:Creature):void
		{
			TweenLite.to(this, COLLECT_TIME, {x:creature.x, y:creature.y, onComplete:onCollectComplete})
			ResourceSystem.getInstance().removeResourceNode(this);
		}

		private function onCollectComplete():void
		{
			this.parent.removeChild(this);
		}
	}
}
