package
{

	import com.furusystems.dconsole2.DConsole;

	import flash.display.Sprite;

	import net.hires.debug.Stats;

	import starling.core.Starling;

	[SWF(width='1024',height='600',backgroundColor='#000000',frameRate='60')]
	public class Hylozo extends Sprite
	{
		private var _starling:Starling;

		public function Hylozo()
		{
			addChild(DConsole.view);

			var stats:Stats = new Stats();
			stats.x = this.width - 70;
			addChild(stats);

			_starling = new Starling(Game, stage);
			_starling.antiAliasing = 1;
			_starling.start();
		}
	}
}
