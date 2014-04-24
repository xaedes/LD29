package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Audio;
	import ashgame.components.Collision;
	import ashgame.components.EnergyStorage;
	import ashgame.components.Mover;
	import ashgame.components.Position;
	
	public class MoverNode extends Node {
		public var mover:Mover;
		public var position:Position
		public var energyStorage:EnergyStorage;
		public var collision:Collision;

	}
}
