/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 3:57 PM
 */
package
{
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;

	public class Landscape extends Sprite
	{
		private static const GRID_BLOCK_SIZE:int = 50;
		private static const GRID_WIDTH:int = 60;
		private static const GRID_HEIGHT:int = 60;
		private const BACKGROUND_COLOUR:int = 0x222222;

		private var _landscapeWidth:int;
		private var _landscapeHeight:int;
		private var _vertices:Vector.<Vector.<Image>>;
		private var _backgroundShape:Shape;

		public function Landscape(stageWidth:int, stageHeight:int)
		{
			_landscapeWidth = stageWidth;
			_landscapeHeight = stageHeight;

			init();
		}

		private function init():void
		{
			//create background
			_backgroundShape = new Shape();
			_backgroundShape.graphics.beginFill(BACKGROUND_COLOUR);
			_backgroundShape.graphics.drawRect(0,0,_landscapeWidth,_landscapeHeight);
			_backgroundShape.graphics.endFill();
			addChild(_backgroundShape);

			//add vertex points
			_vertices = new Vector.<Vector.<Image>>();
			for (var i:int = 0; i < GRID_WIDTH; i++)
			{
				var dimension:Vector.<Image> = new Vector.<Image>();
				for (var j:int = 0; j < GRID_HEIGHT; j++)
				{
					var vertexImage:Image = new Image(Assets.getTexture("Vertex"));
					addChild(vertexImage);
					dimension.push(vertexImage);

					//TODO Fix in image
					vertexImage.alpha = 0.5;
					vertexImage.scaleX = 0.5;
					vertexImage.scaleY = 0.5;

					vertexImage.x = getRealPos(i) -  vertexImage.width/2;
					vertexImage.y = getRealPos(j) - vertexImage.height/2;
				}
				_vertices.push(dimension);
			}
		}

		public static function getRealPos(gridPos:int):int
		{
			return gridPos * GRID_BLOCK_SIZE;
		}
	}
}
