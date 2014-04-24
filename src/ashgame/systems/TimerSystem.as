package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.nodes.TimerNode;
	
	public class TimerSystem extends ListIteratingSystem {
		
		public function TimerSystem() {
			super(TimerNode, updateNode);
		}
		
		private function updateNode(node:TimerNode, time:Number):void {
			node.timer.seconds += time;
		}
	}
}
