
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
	}


  private function handleInput()
  {
		_velocity = 0;

		if (Input.check("left"))
		{
			_velocity = -5;
		}

		if (Input.check("right"))
		{
			_velocity = 5;
		}
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

		moveBy(_velocity, 0);

		setAnimations();

		super.update();
	}
}