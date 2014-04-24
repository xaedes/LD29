package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.nodes.AlphaTweenNode;
	import ashgame.nodes.PositionTweenNode;
	
	public class PositionTweenSystem extends ListIteratingSystem {
		
		public function PositionTweenSystem() {
			super(PositionTweenNode, updateNode);
		}
		
		private function updateNode(node:PositionTweenNode, time:Number):void {
			if (node.tween.start == null) {
				node.tween.start = new Point(0, 0);
				node.tween.current = node.tween.start.clone();
			}
			if ((node.tween.destination != null) && (node.tween.start != null) && (node.tween.time > 0)) {
				node.tween.current.x = node.tween.ease.call(null, node.timer.seconds, node.tween.start.x, node.tween.destination.x - node.tween.start.x, node.tween.time);
				node.tween.current.y = node.tween.ease.call(null, node.timer.seconds, node.tween.start.y, node.tween.destination.y - node.tween.start.y, node.tween.time);
			}
		}
	}
}
