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
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;

import com.haxepunk.tmx.TmxEntity;
import flash.geom.Point;

import entities.Player;
import entities.Block;
import entities.mobs.Bug;
import entities.CodePiece;


class GameWorld extends World {

	private var _player : Player;
	private var _map : TmxEntity;

	public var totalMobs : Int = 0;	
	public var mobsKilled : Int = 0;

	public var totalCodePieces : Int = 0;
	public var codeCollected : Int = 0;

	public function new()
	{
		super();
	}

	public override function begin()
	{
		Input.define("restart", [Key.ESCAPE]);

		_map = new TmxEntity("levels/map.tmx");
		_map.loadGraphic("gfx/tileset.png", ["bg", "stage"]);
		_map.loadMask("stage");
		add(_map);

		_player = new Player(32, 300);
		add(_player);
		
		initObjectsFromMap();
	}

	private function initObjectsFromMap() 
	{
		var mobGroup : TmxObjectGroup = _map.map.getObjectGroup("mobs");
		if(mobGroup != null)
		{
			for(object in mobGroup.objects)
			{
				var m : Bug = new Bug(object.x, object.y - 16);
				add(m);
			}
		}

		var powGroup : TmxObjectGroup = _map.map.getObjectGroup("pows");
		if(powGroup != null)
		{
			for(object in powGroup.objects)
			{
				var m : CodePiece = new CodePiece(1, object.x, object.y);
				add(m);
			}
		}
	}

	public override function update()
	{
		if (Input.check("restart"))
		{
			HXP.world = new GameWorld();
		}

		// Finished the map
		if(_player.x < 0)
		{
			HXP.world = new GameWorld();
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

		updateMobCollisions();
		updateItems();

		super.update();
	}

	private function updateItems():Void
	{
		var code : CodePiece = cast _player.collide('code', _player.x, _player.y);
		if( code != null )
		{
			new Sfx("sfx/code.wav").play();
			remove(code);
			codeCollected++;
		}
	}

	private function updateMobCollisions()
	{
		var mob : Bug = cast _player.collide('mob', _player.x, _player.y);
		if( mob != null )
		{			
			new Sfx("sfx/die.wav").play();
			_player.hp--;
			if(_player.hp <= 0)
				HXP.world = new GameOverWorld();
		}
	}
}