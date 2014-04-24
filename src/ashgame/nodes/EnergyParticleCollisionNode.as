package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Circle;
	import ashgame.components.CircleCircleCollision;
	import ashgame.components.Collision;
	import ashgame.components.EnergyParticle;
	import ashgame.components.EnergyStorage;
	import ashgame.components.Position;
	
	public class EnergyParticleCollisionNode extends Node {
		public var energyParticle:EnergyParticle;
		public var energyStorage:EnergyStorage;
		public var position:Position;
		public var collision:CircleCircleCollision;
		public var circle:Circle;
	}
}
