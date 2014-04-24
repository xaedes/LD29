package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.FitCircleToSize;
	import ashgame.components.Position;
	import ashgame.components.Size;
	import ashgame.nodes.AlphaTweenNode;
	import ashgame.nodes.FitCircleToSizeNode;
	import ashgame.nodes.FitSizeAroundOtherEntityNode;
	
	public class FitCircleToSizeSystem extends ListIteratingSystem {
		
		public function FitCircleToSizeSystem() {
			super(FitCircleToSizeNode, updateNode);
		}
		
		private function updateNode(node:FitCircleToSizeNode, time:Number):void {
			if (node.fitCircleToSize.align == FitCircleToSize.ALIGN_AROUND) {
				if (node.size.align == Size.ALIGN_CENTER_CENTER) {
					var diag:Number = Math.sqrt(node.size.size.x * node.size.size.x + node.size.size.y * node.size.size.y);
					node.circle.radius = diag / 2;
				}
			}
		}
	}
}
