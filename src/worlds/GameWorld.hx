package worlds;

import com.haxepunk.World;
import com.haxepunk.graphics.Image;

import entities.Player;

class GameWorld extends World {
	
	public function new()
	{
		super();
	}

	public override function begin()
	{
		add(new Player(30, 50));
	}

}