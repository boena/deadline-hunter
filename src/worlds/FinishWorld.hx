
package worlds;

import com.haxepunk.HXP;
import com.haxepunk.World;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;

class FinishWorld extends World {

	private var _collectedCode:Int;
	private var _totalCode:Int;
	private var _killedMobs:Int;
	private var _totalMobs:Int;

	public function new(collectedCode:Int, totalCode:Int, killedMobs:Int, totalMobs:Int)
	{
		_collectedCode = collectedCode;
		_totalCode = totalCode;
		_killedMobs = killedMobs;
		_totalMobs = totalMobs;	

		super();
	}

	public override function begin()
	{
		addGraphic(new Image("gfx/finished.png"));		
		Input.define("restart", [Key.ENTER]);

		var descriptionEntity = new Entity(200 , 300);				
		var descriptionText = new Text("Code collected:\nMobs killed:", 0, 0, 0, 0);		
		descriptionEntity.graphic = descriptionText;
		add(descriptionEntity);

		var numbersEntity = new Entity(400 , 300);				
		var numbersText = new Text(_collectedCode + " of " + _totalCode + "\n" + _killedMobs + " of " + _totalMobs, 0, 0, 0, 0);		
		numbersEntity.graphic = numbersText;
		add(numbersEntity);
	}

	public override function update()
	{
		if (Input.check("restart"))
		{
			new Sfx("sfx/power.wav").play();
			HXP.world = new GameWorld();
		}		
	}

}