
package entities.weapons;

class MeleeWeapon extends Weapon {
	
	private var _player : Player;
	private var _hittingLength : Int;
	
	public override function update()
	{
		super.update();
		
		y = _player.y + _player.height / 2;

		if(_player.facingLeft)
		{
			x = _player.x - width + 6;
		}
		else
		{
			x = _player.x + _player.width - 6;
		}
	}

	public override function use()
	{
		graphic.visible = true;
	}
}