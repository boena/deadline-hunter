package worlds;

import com.haxepunk.HXP;
import com.haxepunk.tmx.TmxMap;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.tmx.TmxObject;
import com.haxepunk.tmx.TmxObjectGroup;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;
import com.haxepunk.World;

import com.haxepunk.tmx.TmxEntity;
import flash.geom.Point;

import entities.Player;
import entities.Block;


class GameWorld extends World {

	private var _player : Player;
			
	public function new()
	{
		super();
	}

	public override function begin()
	{
		var _map = new TmxEntity("levels/map.tmx");
		_map.loadGraphic("gfx/tileset.png", ["stage"]);
		_map.loadMask("stage");
		add(_map);

		_player = new Player(0, 0);
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