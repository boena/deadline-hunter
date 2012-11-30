
package entities;

import com.haxepunk.Entity;

class Block extends Entity {
	public function new(x:Int, y:Int) 
	{
		super(x, y);

		type = "solid";
		collidable = true;		
		setHitbox(32,32);
	}
}