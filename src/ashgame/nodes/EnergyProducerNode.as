package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyProducer;
	import ashgame.components.EnergyStorage;
	
	public class EnergyProducerNode extends Node {
		public var energyStorage:EnergyStorage;
		public var energyProducer:EnergyProducer;
	}
}
