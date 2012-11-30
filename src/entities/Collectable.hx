
package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import flash.geom.Rectangle;

class Collectable extends Entity
{
	var _sprite : Spritemap;
	var _objectGid : Int;
	
	public function new (objectGid: Int, px: Int, py: Int) 
	{
		super(px, py - 16);
		
		_objectGid = objectGid;
		
		_sprite = new Spritemap("gfx/tileset.png", 32, 32);
		
		graphic = _sprite;
	}
	
	public function animEnd():Void
	{
		// override it if needed
	}
}