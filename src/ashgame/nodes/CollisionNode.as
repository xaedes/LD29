package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Collision;
	import ashgame.components.Position;
	import ashgame.components.Size;
	
	public class CollisionNode extends Node {
		public var size:Size;
		public var position:Position;
		public var collision:Collision;
	}

}