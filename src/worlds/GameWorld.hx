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
		var e = new TmxEntity("levels/map.tmx");
		e.loadGraphic("gfx/tileset.png", ["stage"]);
		e.loadMask("stage");
		add(e);

		//var block = new Block(0, 400);
		//add(block);

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