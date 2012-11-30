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
import entities.mobs.Bug;


class GameWorld extends World {

	private var _player : Player;
	private var _map : TmxEntity;
			
	public function new()
	{
		super();
	}

	public override function begin()
	{
		_map = new TmxEntity("levels/map.tmx");
		_map.loadGraphic("gfx/tileset.png", ["stage"]);
		_map.loadMask("stage");
		add(_map);

		_player = new Player(0, 300);
		add(_player);

		var bug = new Bug(485, 300);
		add(bug);
		
		Input.define("restart", [Key.ESCAPE]);
	}

	public override function update()
	{
		if (Input.check("restart"))
		{
			// Restart level
		}

		//Center the camera on the player
		if(_player.x - HXP.width / 2 < 0)
		{
			HXP.setCamera(0, _player.y + _player.height / 2 - HXP.height / 2);
		}
		else if (_player.x + HXP.width / 2 > _map.width) 
		{
			HXP.setCamera(_map.width -  HXP.width, _player.y + _player.height / 2 - HXP.height / 2);
		}
		else
		{
			HXP.setCamera(_player.x + _player.width / 2 - HXP.width / 2, _player.y + _player.height / 2 - HXP.height / 2);
		}

		super.update();
	}
}