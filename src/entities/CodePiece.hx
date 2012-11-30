
package entities;

import com.haxepunk.HXP;

class CodePiece extends Collectable {
	public function new(objectGid: Int, px: Int, py: Int)
	{
		super(objectGid, px, py);
				
		type = 'code';
		setHitbox(32, 32);
		
		_sprite.add("code", [6]);
		_sprite.play("code");
	}
}