package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.nodes.RedrawingNode;
	
	public class RedrawingSystem extends ListIteratingSystem {
		public function RedrawingSystem() {
			super(RedrawingNode, updateNode);
		}
		
		private function updateNode(node:RedrawingNode, time:Number):void {
			node.redrawing.redrawable.redraw(time);
		}
	}
}
