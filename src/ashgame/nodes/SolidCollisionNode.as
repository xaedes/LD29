package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Circle;
	import ashgame.components.CircleCircleCollision;
	import ashgame.components.Collision;
	import ashgame.components.Mass;
	import ashgame.components.Motion;
	import ashgame.components.Position;
	import ashgame.components.SolidCollision;
	
	public class SolidCollisionNode extends Node {
		public var position:Position;
		public var motion:Motion;
		public var mass:Mass;
		public var collision:CircleCircleCollision;
		public var solidCollision:SolidCollision;
		public var circle:Circle;
	}
}
