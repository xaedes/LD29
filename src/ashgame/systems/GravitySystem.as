package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ashgame.components.Gravity;
	import ashgame.components.Position;
	import ashgame.nodes.GravityNode;
	
	public class GravitySystem extends ListIteratingSystem {
		
		public function GravitySystem() {
			super(GravityNode, updateNode);
		}
		
		private function updateNode(node:GravityNode, time:Number):void {
			var position:Position = node.position;
			var gravity:Gravity = node.gravity;
			
			var diff:Point = gravity.towards.subtract(position.position);
			diff.normalize(gravity.strength * time);
			position.position.x += diff.x;
			position.position.y += diff.y;
		}
	}
}
