package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.EnergyStorage;
	import ashgame.components.HasEnergyStorageView;
	import ashgame.nodes.EnergyStorageViewNode;
	
	public class EnergyStorageViewSystem extends ListIteratingSystem {
		public function EnergyStorageViewSystem() {
			super(EnergyStorageViewNode, updateNode);
		}
		
		private function updateNode(node:EnergyStorageViewNode, time:Number):void {
			var hasEnergyStorageView:HasEnergyStorageView = node.hasEnergyStorageView;
			var energyStorage:EnergyStorage = node.energyStorage;
			
			if ((energyStorage.energy != hasEnergyStorageView.energyStorageView.value) || (energyStorage.maxEnergy != hasEnergyStorageView.energyStorageView.max)) {
				hasEnergyStorageView.energyStorageView.setMax(energyStorage.maxEnergy);
				hasEnergyStorageView.energyStorageView.setValue(energyStorage.energy);
				hasEnergyStorageView.energyStorageView.draw();
			}
		}
	}
}
