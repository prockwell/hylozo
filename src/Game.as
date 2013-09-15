/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 3:01 PM
 */
package
{
	import creatures.Builder;

	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite
	{
		private var _landscape:Landscape;
		private var _structure:Structure;
		private var _resources:ResourceSystem;

		public function Game()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(e:Event):void
		{
			//create landscape
			_landscape = new Landscape(stage.stageWidth, stage.stageHeight);
			addChild(_landscape);

			//add structure
			_structure = Structure.getInstance();
			addChild(_structure);

			//add resources
			_resources = ResourceSystem.getInstance();
			addChild(_resources);

			//populate
			populateWorld();
		}

		private function populateWorld():void
		{
			var builder:Builder = new Builder();
			builder.gridPosX = 5;
			builder.gridPosY = 5;
			addChild(builder);
		}
	}
}
