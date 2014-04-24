package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyStorage;
	import ashgame.components.EnergyStorageEmitter;
	import ashgame.components.Motion;
	import ashgame.components.Position;
	
	public class EnergyStorageEmitterNode extends Node {
		public var position:Position;
		public var motion:Motion;
		public var energyStorage:EnergyStorage;
		public var energyStorageEmitter:EnergyStorageEmitter;
	}
}
