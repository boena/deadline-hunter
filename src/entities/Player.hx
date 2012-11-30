
package entities;

import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Player extends Entity {

	private var _velocity:Float;
	private var _acceleration:Float;

	public function new(x:Int, y:Int)
	{
		super(x, y);

		graphic = new Image("gfx/player.png");

		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("right", [Key.RIGHT, Key.D]);

		setHitbox(32,32);

		_velocity = 0;
	}


  private function handleInput()
  {
		_acceleration = 0;

		if (Input.check("left"))
		{
			_acceleration = -1;
		}

		if (Input.check("right"))
		{
			_acceleration = 1;
		}
  }

  public override function moveCollideX(e:Entity)
  {
  	_velocity = 0;
  }

  private function move() 
  {
  	_velocity += _acceleration;
  	if(Math.abs(_velocity) > 5)
  	{
  		_velocity = 5 * HXP.sign(_velocity);
  	}

  	if(_velocity < 0)
  	{
  		_velocity = Math.min(_velocity + 0.4, 0);
  	}
  	else if(_velocity > 0)
  	{
  		_velocity = Math.max(_velocity - 0.4, 0);
  	}

  	moveBy(_velocity, 0, "block");
  }
 
	private function setAnimations()
	{
		/*if (velocity == 0)
		{
			// we are stopped, set animation to idle
			sprite.play("idle");
		}
		else
		{
			// we are moving, set animation to walk
			sprite.play("walk");

			// this will flip our sprite based on direction
			if (velocity < 0) // left
			{
				sprite.flipped = true;
			}
			else // right
			{
				sprite.flipped = false;
			}
		}*/
	}
 

	public override function update()
	{
		handleInput();

		move();

		setAnimations();

		super.update();
	}
}