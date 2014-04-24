package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyStorage;
	import ashgame.components.EnergyStorageWarning;
	import ashgame.components.Position;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class EnergyStorageWarningNode extends Node {
		public var energyStorageWarning:EnergyStorageWarning;
		public var position:Position;
		public var energyStorage:EnergyStorage;
	
	}

}