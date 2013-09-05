/**
 * Created with IntelliJ IDEA.
 * User: peterrockwell
 * Date: 2013-09-02
 * Time: 5:16 PM
 */
package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;

	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../media/graphics/vertex.png")]
		public static const Vertex:Class;

		private static var _gameTextures:Dictionary = new Dictionary();

		public static function getTexture(name:String):Texture
		{
			if(_gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				_gameTextures[name] = Texture.fromBitmap(bitmap);

			}
			return _gameTextures[name];
		}
	}
}
