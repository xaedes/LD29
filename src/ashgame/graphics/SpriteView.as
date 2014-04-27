package ashgame.graphics {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class SpriteView extends Sprite implements Redrawable {
		private var _tile_width:uint;
		private var _tile_height:uint;
		
		public function SpriteView(Asset:Class, tile_width:uint, _tile_height:uint) {
			super();
			this.buttonMode = false;
			var sprite:DisplayObject = new Asset();
			
			sprite.x = 0;
			sprite.y = 0;
			this._tile_width = tile_width;
			this._tile_height = _tile_height;
			
			addChild(sprite);
		
		}
		
		/* INTERFACE ashgame.graphics.Redrawable */
		
		public function redraw(time:Number):void {
		
		}
	
	}

}