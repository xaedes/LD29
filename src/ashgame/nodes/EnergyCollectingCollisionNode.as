package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Circle;
	import ashgame.components.CircleCircleCollision;
	import ashgame.components.Collision;
	import ashgame.components.EnergyCollecting;
	import ashgame.components.EnergyStorage;
	import ashgame.components.Position;
	
	public class EnergyCollectingCollisionNode extends Node {
		public var position:Position;
		public var collision:CircleCircleCollision;
		public var circle:Circle;
		public var energyStorage:EnergyStorage;
		public var energyCollecting:EnergyCollecting;
	}
}
