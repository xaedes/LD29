package ashgame.systems {
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ashgame.components.EnergyStorage;
	import ashgame.components.EnergyStorageEmitter;
	import ashgame.components.Motion;
	import ashgame.components.Position;
	import ashgame.EntityCreator;
	import ashgame.nodes.EnergyStorageEmitterNode;
	import ashgame.Utils;
	
	public class EnergyStorageEmitterSystem extends ListIteratingSystem {
		private var creator:EntityCreator;
		private var energyParticles:NodeList;
		private var movers:NodeList;
		
		public function EnergyStorageEmitterSystem(creator:EntityCreator) {
			this.creator = creator;
			super(EnergyStorageEmitterNode, updateNode);
		}
		
		private function updateNode(node:EnergyStorageEmitterNode, time:Number):void {
			var energyStorageEmitter:EnergyStorageEmitter = node.energyStorageEmitter;
			var energyStorage:EnergyStorage = node.energyStorage;
			var motion:Motion = node.motion;
			var position:Position = node.position;
			
			if (energyStorageEmitter.countdown >= 0) {
				energyStorageEmitter.countdown -= time;
			}
			if ((energyStorage.energy > energyStorage.maxEnergy) && (energyStorageEmitter.countdown <= 0)) {
				
				energyStorageEmitter.countdown = energyStorageEmitter.interval;
				energyStorage.energy -= energyStorageEmitter.amount;
				
				// emit particles
				for (var i:int = 0; i < energyStorageEmitter.nParticles; i++) {
					// create particle
					var energyParticleEntity:Entity = creator.createEnergyParticle(energyStorageEmitter.amount / energyStorageEmitter.nParticles);
					var particlePos:Position = energyParticleEntity.get(Position);
					var particleMotion:Motion = energyParticleEntity.get(Motion);
					
					// create random position
					var angle:Number = Math.random() * 2 * Math.PI;
					var offset:Point = new Point(Math.cos(angle), Math.sin(angle));
					offset.normalize(energyStorageEmitter.spawnRadius);
					particlePos.position = position.position.add(offset);
					
					// add velocity
					offset.normalize(Utils.randomRange(energyStorageEmitter.spawnSpeedMin, energyStorageEmitter.spawnSpeedMax));
					particleMotion.velocity = Utils.mult(motion.velocity, energyStorageEmitter.emitterVelocityInfluence).add(offset);
				}
				
			}
		
		}
	}
}
