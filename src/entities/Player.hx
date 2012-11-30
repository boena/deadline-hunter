
package entities;

import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Circle;

private enum JumpStyle
{
	Normal;
	Gravity;
	Disable;
}

class Player extends PhysicsEntity 
{
	private static var jumpStyle:JumpStyle = Normal;
	private static inline var kMoveSpeed:Float = 1.2;
	private static inline var kJumpForce:Int = 20;

	public var hasTouchTheGround(default, null) : Bool;

	public function new(x:Int, y:Int)
	{
		super(x, y);

		hasTouchTheGround = false;

		graphic = new Image("gfx/player.png");

		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("right", [Key.RIGHT, Key.D]);
		Input.define("jump", [Key.UP, Key.W]);
		Input.define("attack", [Key.SPACE]);

		setHitbox(48, 32);

		// Set physics
		gravity.y = 1.8;
		maxVelocity.y = kJumpForce;
		maxVelocity.x = kMoveSpeed * 4;
		friction.x = 0.82; // floor friction
		friction.y = 0.99; // wall friction
	} 

	public override function update()
	{
		acceleration.x = acceleration.y = 0;

		if( !hasTouchTheGround && _onGround) hasTouchTheGround = true;

		handleInput();

		setAnimations();

		super.update();
	}

	private function handleInput()
  {
  	if (hasTouchTheGround && Input.check("left"))
		{
			trace("left pushed");
			acceleration.x = -kMoveSpeed;
		}
		else if (hasTouchTheGround && Input.check("right"))
		{
			trace("right pushed");
			acceleration.x = kMoveSpeed;
		}

		if(_onGround && Input.pressed("jump"))
		{
			trace("jump pushed");
			switch (jumpStyle)
			{
				case Normal:
					acceleration.y = -HXP.sign(gravity.y) * kJumpForce;
				case Gravity:
					gravity.y = -gravity.y;
				case Disable:
			}
		}

		if(_onGround && Input.pressed("attack"))
		{
			trace("attack pushed");
			// TODO: Add attack logic.
		}
  }

  private function setAnimations()
	{
		/*if (velocity.x == 0)
		{
			// we are stopped, set animation to idle
			sprite.play("idle");
		}
		else
		{
			// we are moving, set animation to walk
			sprite.play("walk");

			// this will flip our sprite based on direction
			if (velocity.x < 0) // left
			{
				sprite.flipped = true;
			}
			else // right
			{
				sprite.flipped = false;
			}
		}*/
	}
}