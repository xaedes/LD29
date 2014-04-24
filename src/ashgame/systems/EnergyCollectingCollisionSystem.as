package ashgame.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ashgame.Assets;
	import ashgame.components.Audio;
	import ashgame.components.Display;
	import ashgame.components.Player;
	import ashgame.components.Position;
	import ashgame.EntityCreator;
	import ashgame.GameConfig;
	import ashgame.nodes.EnergyCollectingCollisionNode;
	import ashgame.nodes.EnergyParticleCollisionNode;
	
	public class EnergyCollectingCollisionSystem extends System {
		private var creator:EntityCreator;
		private var config:GameConfig;
		
		private var energyParticlesFamily:ComponentMatchingFamily;
		private var energyCollectors:NodeList;
		
		public function EnergyCollectingCollisionSystem(creator:EntityCreator, config:GameConfig) {
			this.creator = creator;
			this.config = config;
		}
		
		override public function addToEngine(engine:Engine):void {
			energyParticlesFamily = ComponentMatchingFamily(engine.getFamily(EnergyParticleCollisionNode));
			energyCollectors = engine.getNodeList(EnergyCollectingCollisionNode);
		}
		
		override public function update(time:Number):void {
			var energyCollector:EnergyCollectingCollisionNode;
			var entity:Entity;
			
			for (energyCollector = energyCollectors.head; energyCollector; energyCollector = energyCollector.next) {
				for each (entity in energyCollector.collision.collidingEntities) {
					var energyParticle:EnergyParticleCollisionNode = EnergyParticleCollisionNode(energyParticlesFamily.entities[entity]);
					if (energyParticle) {
						creator.destroyEntity(energyParticle.entity);
						
						energyCollector.energyStorage.energy += energyParticle.energyStorage.energy;
						
						if (energyCollector.entity.has(Player)) {
							var text:Entity = creator.createFloatingText("+", 1);
							var textPosition:Position = Position(text.get(Position));
							textPosition.position.x = energyCollector.position.position.x;
							textPosition.position.y = energyCollector.position.position.y;
							
							if (energyCollector.entity.has(Audio)) {
								
								var audio:Audio = energyCollector.entity.get(Audio);
								audio.play(Assets.CollectEnergy, 0.7);
							}
						}
						
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			energyParticlesFamily = null;
			energyCollectors = null;
		}
	}
}
