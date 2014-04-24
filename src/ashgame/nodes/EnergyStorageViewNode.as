package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyStorage;
	import ashgame.components.HasEnergyStorageView;
	
	public class EnergyStorageViewNode extends Node {
		public var energyStorage:EnergyStorage;
		public var hasEnergyStorageView:HasEnergyStorageView;
	}
}
