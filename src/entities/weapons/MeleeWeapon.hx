
package entities.weapons;

class MeleeWeapon extends Weapon {
	
	private var _player : Player;
	private var _hittingLength : Int;
	private var targetX : Int;
	private var inMotion : Bool;
	private var reverseMotion : Bool;

	public override function update()
	{
		super.update();
				
		y = _player.y + _player.height / 2;

		if( targetX < _hittingLength && !reverseMotion )
		{	
			targetX++;
		}
		else
		{
			reverseMotion = true;
			targetX--;
		}

		if(_player.facingLeft)
		{	
			x = _player.x - width + 8;
			x -= targetX;
		}
		else
		{
			x = _player.x + _player.width - 6;
			x += targetX;
		}

		if(targetX == 0)
		{
			inMotion = false;
			graphic.visible = false;
		}
		
	}

	public override function use()
	{
		if( !inMotion ) 
		{
			inMotion = true;
			reverseMotion = false;
			targetX = 0;
			graphic.visible = true;
		}
	}
}