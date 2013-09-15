/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-14
 * Time: 4:35 PM
 */
package
{
	import starling.display.Sprite;

	import utils.GridPosition;
	import utils.MathUtils;

	public class ResourceSystem extends Sprite
	{
		private static var _instance:ResourceSystem;
		private var _resourceNodes:Vector.<ResourceNode>;
		private const INITIAL_RESOURCES:int = 30;
		private const COLLECT_DISTANCE:Number = 100;

		public static function getInstance():ResourceSystem
		{
			if (_instance == null)
			{
				_instance = new ResourceSystem();
			}
			return _instance;
		}

		public function ResourceSystem()
		{
			_resourceNodes = new Vector.<ResourceNode>();
			init();
		}

		private function init():void
		{
			for (var i:int = 0; i < INITIAL_RESOURCES; i++)
			{
				var resourceNode:ResourceNode = new ResourceNode();
				resourceNode.x = MathUtils.randomRange(0, Constants.LANDSCAPE_WIDTH);
				resourceNode.y = MathUtils.randomRange(0, Constants.LANDSCAPE_HEIGHT);
				this.addChild(resourceNode);
				_resourceNodes.push(resourceNode);
			}
		}

		public function checkForResources(builderPos:GridPosition):int
		{
			var resourcesCollected:int = 0;

			for (var i:int = 0; i < _resourceNodes.length; i++)
			{
				var resourceNode:ResourceNode = _resourceNodes[i];
				var distance:Number = MathUtils.distanceBetweenTwoPoints(builderPos.realX, builderPos.realY, resourceNode.x, resourceNode.y);

				if(distance <= COLLECT_DISTANCE)
				{
					resourcesCollected++;
					resourceNode.collect(builderPos);
				}

			}

			return resourcesCollected;
		}

		private function update():void
		{
			//Generate new resources
		}
	}
}
