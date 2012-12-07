
package entities.weapons;

import com.haxepunk.Entity;

class Weapon extends Entity {
	
	public var _facingLeft:Bool;
	public var _visible:Bool = false;

	public function new(x:Float, y:Float, facingLeft:Bool)
	{
		super(x, y);
		_facingLeft = facingLeft;
	}

	public function use(player:Player)
	{

	}
}