package ashgame.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ashgame.Assets;
	import ashgame.components.Audio;
	import ashgame.components.Circle;
	import ashgame.components.Player;
	import ashgame.EntityCreator;
	import ashgame.GameConfig;
	import ashgame.nodes.AttractableNode;
	import ashgame.nodes.AttractorNode;
	import ashgame.nodes.EnergyCollectingCollisionNode;
	import ashgame.nodes.EnergyParticleCollisionNode;
	import ashgame.Utils;
	
	public class AttractorSystem extends System {
		private var attractableFamily:ComponentMatchingFamily;
		private var attractors:NodeList;
		
		public function AttractorSystem() {
		}
		
		override public function addToEngine(engine:Engine):void {
			attractableFamily = ComponentMatchingFamily(engine.getFamily(AttractableNode));
			attractors = engine.getNodeList(AttractorNode);
		}
		
		override public function update(time:Number):void {
			var attractor:AttractorNode;
			var entity:Entity;
			
			for (attractor = attractors.head; attractor; attractor = attractor.next) {
				for each (entity in attractor.collision.collidingEntities) {
					var attractable:AttractableNode = AttractableNode(attractableFamily.entities[entity]);
					if (attractable) {
						var minRadius:Number = attractor.circle.radius;
						var attractableCircle:Circle = attractable.entity.get(Circle);
						if (attractableCircle)
							minRadius += attractableCircle.radius;
						var diff:Point = attractable.position.position.subtract(attractor.position.position);
						if (diff.length <= minRadius) {
							diff.normalize(attractor.attracting.strength * attractable.attractable.factor);
							
							//attractable.position.position
							Utils.pointSub(attractable.motion.velocity, diff);
								//attractable.motion.velocity
						}
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			attractableFamily = null;
			attractors = null;
		}
	}
}
