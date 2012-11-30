package worlds;

import com.haxepunk.World;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import com.haxepunk.tmx.TmxEntity;

import entities.Player;

class GameWorld extends World {

	private var _player:Player;
	
	public function new()
	{
		super();
	}

	public override function begin()
	{
		var e = new TmxEntity("levels/map.tmx");
		e.loadGraphic("gfx/tileset.png", ["bg"]);
		e.loadMask("bg", "collidable");
		add(e);

		_player = new Player(30, 352);
		add(_player);

		Input.define("restart", [Key.ESCAPE]);
	}

	public override function update()
	{
		if (Input.check("restart"))
		{
			// Restart level
		}

		super.update();
	}
}