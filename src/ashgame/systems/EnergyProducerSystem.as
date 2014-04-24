package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.EnergyProducer;
	import ashgame.components.EnergyStorage;
	import ashgame.nodes.EnergyProducerNode;
	
	public class EnergyProducerSystem extends ListIteratingSystem {
		
		public function EnergyProducerSystem() {
			super(EnergyProducerNode, updateNode);
		
		}
		
		private function updateNode(node:EnergyProducerNode, time:Number):void {
			var energyProducer:EnergyProducer = node.energyProducer;
			var energyStorage:EnergyStorage = node.energyStorage;
			
			if (energyProducer.countdown > 0) {
				energyProducer.countdown -= time;
			} else {
				energyProducer.countdown = energyProducer.interval;
				energyStorage.energy += energyProducer.amount;
			}
		
		}
	}
}
