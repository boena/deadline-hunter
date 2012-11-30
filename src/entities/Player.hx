
package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Player extends Entity {

	public function new(x:Int, y:Int)
	{
		super(x, y);		
		graphic = new Image("gfx/player.png");
	}
}