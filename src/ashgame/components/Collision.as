package ashgame.components {
	import ash.core.Entity;
	import de.polygonal.ds.HashSet;
	import de.polygonal.ds.Set;
	import flash.utils.Dictionary;
	
	public class Collision {
		public var collidingEntities:Dictionary = new Dictionary();
		
		public function Collision() {
		}
		
		public function clear():void {
			for (var key:Object in collidingEntities)
				delete collidingEntities[key];
		}
	}
}
