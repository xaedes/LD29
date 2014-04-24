package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Circle;
	import ashgame.components.CircleCircleCollision;
	import ashgame.components.Collision;
	import ashgame.components.Position;
	
	public class CircleCircleCollisionNode extends Node {
		public var circleCollision:CircleCircleCollision;
		public var collision:Collision;
		public var circle:Circle;
		public var position:Position;
	
	}

}