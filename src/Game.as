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

			//populate
			var builder:Builder = new Builder();
			builder.gridPosX = 5;
			builder.gridPosY = 10;
			addChild(builder);
		}
	}
}
