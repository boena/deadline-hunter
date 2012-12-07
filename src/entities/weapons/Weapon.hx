
package entities.weapons;

import com.haxepunk.Entity;
import entities.PhysicsEntity;

class Weapon extends PhysicsEntity {
	
	public var hitDamage:Int = 1;

	public function new(x:Float, y:Float)
	{
		super(x, y);
	}

	public function use()
	{

	}
}