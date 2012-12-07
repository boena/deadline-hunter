
package entities.weapons;

import com.haxepunk.graphics.Image;
import entities.Player;
import entities.weapons.HandheldWeapon;

class Sword extends HandheldWeapon {	
	private var _player : Player;

	public function new(x:Float, y:Float, player:Player)
	{
		super(x, y, player.facingLeft);
		
		_player = player;
		_visible = false;

		graphic = Image.createRect(16, 4);
		setHitbox(16, 4);
	}

	public override function use(player:Player)
	{
		_visible = true;

/*		y = player.y + player.height / 2;

		if(player.facingLeft)
		{
			x = player.x - width;
		}
		else
		{
			x = player.x + player.width;
		}*/
	}

	public override function update()
	{
	//	var moveX = _facingLeft ? -20 : 20;
		//moveBy(moveX, 0, "mob");
		super.update();
		
		y = _player.y + _player.height / 2;

		if(_player.facingLeft)
		{
			x = _player.x - width;
		}
		else
		{
			x = _player.x + _player.width;
		}

		
	}
}