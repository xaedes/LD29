package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.components.Size;
	import ashgame.nodes.AlphaTweenNode;
	import ashgame.nodes.FitSizeAroundOtherEntityNode;
	
	public class FitSizeAroundOtherEntitySystem extends ListIteratingSystem {
		
		public function FitSizeAroundOtherEntitySystem() {
			super(FitSizeAroundOtherEntityNode, updateNode);
		}
		
		private function updateNode(node:FitSizeAroundOtherEntityNode, time:Number):void {
			if (node.fitSizeAroundOtherEntity.otherEntity.has(Size)) {
				var size:Size = (node.fitSizeAroundOtherEntity.otherEntity.get(Size));
				node.size.size.x = size.size.x + node.fitSizeAroundOtherEntity.padding * 2;
				node.size.size.y = size.size.y + node.fitSizeAroundOtherEntity.padding * 2;
			}
		}
	}
}
