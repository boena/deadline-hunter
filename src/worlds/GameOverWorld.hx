
package worlds;

import com.haxepunk.HXP;
import com.haxepunk.World;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;

class GameOverWorld extends World {

	public function new()
	{
		super();
	}

	public override function begin()
	{
		addGraphic(new Image("gfx/gameover.png"));
		Input.define("restart", [Key.ESCAPE]);
	}

	public override function update()
	{
		if (Input.check("restart"))
		{
			new Sfx("sfx/power.wav").play();
			HXP.world = new GameWorld();
		}
	}

}