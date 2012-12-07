
package entities.weapons;

import com.haxepunk.graphics.Image;
import entities.Player;
import entities.weapons.MeleeWeapon;

class Sword extends MeleeWeapon 
{	
	public function new(x:Float, y:Float, player:Player)
	{
		super(x, y);
		
		_player = player;
		_hittingLength = 20;

		graphic = Image.createRect(16, 4);
		graphic.visible = false;
		
		setHitbox(20, 4);
	}
}