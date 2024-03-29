import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new com.haxepunk.Preloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		
		haxe.Log.trace = flashTrace; // null
		

		if (call_real)
			begin ();
	}

	
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;

        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			nme.Lib.current.addChild(cast (Type.createInstance(Main, []), nme.display.DisplayObject));	
		}
		
	}

	static function onEnter (_) {
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="gfx/debug/console_debug.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_debug.png");
         
		
		if (inName=="gfx/debug/console_logo.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_logo.png");
         
		
		if (inName=="gfx/debug/console_output.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_output.png");
         
		
		if (inName=="gfx/debug/console_pause.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_pause.png");
         
		
		if (inName=="gfx/debug/console_play.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_play.png");
         
		
		if (inName=="gfx/debug/console_step.png")
			 
            return Assets.getBitmapData ("gfx/debug/console_step.png");
         
		
		if (inName=="gfx/preloader/haxepunk.png")
			 
            return Assets.getBitmapData ("gfx/preloader/haxepunk.png");
         
		
		if (inName=="font/04B_03__.ttf")
			 
			 return Assets.getFont ("font/04B_03__.ttf");
		 
		
		if (inName=="gfx/bug.png")
			 
            return Assets.getBitmapData ("gfx/bug.png");
         
		
		if (inName=="gfx/code.png")
			 
            return Assets.getBitmapData ("gfx/code.png");
         
		
		if (inName=="gfx/finished.png")
			 
            return Assets.getBitmapData ("gfx/finished.png");
         
		
		if (inName=="gfx/gameover.png")
			 
            return Assets.getBitmapData ("gfx/gameover.png");
         
		
		if (inName=="gfx/hq.png")
			 
            return Assets.getBitmapData ("gfx/hq.png");
         
		
		if (inName=="gfx/menu.png")
			 
            return Assets.getBitmapData ("gfx/menu.png");
         
		
		if (inName=="gfx/player.png")
			 
            return Assets.getBitmapData ("gfx/player.png");
         
		
		if (inName=="gfx/sword.png")
			 
            return Assets.getBitmapData ("gfx/sword.png");
         
		
		if (inName=="gfx/tileset.png")
			 
            return Assets.getBitmapData ("gfx/tileset.png");
         
		
		if (inName=="sfx/code.wav")
			 
            return Assets.getSound ("sfx/code.wav");
         
		
		if (inName=="sfx/die.wav")
			 
            return Assets.getSound ("sfx/die.wav");
         
		
		if (inName=="sfx/power.wav")
			 
            return Assets.getSound ("sfx/power.wav");
         
		
		if (inName=="font/04B_03__.ttf")
			 
			 return Assets.getFont ("font/04B_03__.ttf");
		 
		
		if (inName=="levels/map.tmx")
			 
            return Assets.getBytes ("levels/map.tmx");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}


class NME_gfx_debug_console_debug_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_debug_console_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_debug_console_output_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_debug_console_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_debug_console_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_debug_console_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_preloader_haxepunk_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_font_04b_03___ttf extends nme.text.Font { }
class NME_gfx_bug_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_code_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_finished_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_gameover_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_hq_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_menu_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_player_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_sword_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_gfx_tileset_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_sfx_code_wav extends nme.media.Sound { }
class NME_sfx_die_wav extends nme.media.Sound { }
class NME_sfx_power_wav extends nme.media.Sound { }
class NME_font_5 extends nme.text.Font { }
class NME_levels_map_tmx extends nme.utils.ByteArray { }

