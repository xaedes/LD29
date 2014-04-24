package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.components.Size;
	import ashgame.nodes.AlphaTweenNode;
	import ashgame.nodes.FitSizeAroundOtherEntityNode;
	import ashgame.nodes.UpdateCircleViewNode;
	
	public class UpdateCircleViewSystem extends ListIteratingSystem {
		
		public function UpdateCircleViewSystem() {
			super(UpdateCircleViewNode, updateNode);
		}
		
		private function updateNode(node:UpdateCircleViewNode, time:Number):void {
			node.updateCircleView.circleView.radius = node.circle.radius;
		}
	}
}
