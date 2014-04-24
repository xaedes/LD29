package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.EntityCreator;
	import ashgame.nodes.AnchorNode;
	import ashgame.nodes.LifetimeNode;
	
	public class LifetimeSystem extends ListIteratingSystem {
		private var creator:EntityCreator;
		
		public function LifetimeSystem(creator:EntityCreator) {
			this.creator = creator;
			super(LifetimeNode, updateNode);
		}
		
		private function updateNode(node:LifetimeNode, time:Number):void {
			if (node.timer.seconds > node.lifetime.lifetime) {
				creator.destroyEntity(node.entity);
			}
		}
	}
}
