package ashgame.systems {
	import ash.core.Entity;
	import ash.tools.ListIteratingSystem;
	import flash.events.TouchEvent;
	import flash.utils.Dictionary;
	import ashgame.components.AlphaTween;
	import ashgame.components.Anchor;
	import ashgame.components.Display;
	import ashgame.components.Lifetime;
	import ashgame.components.MembranChainUpdateOrderedEntities;
	import ashgame.components.Redrawing;
	import ashgame.components.Timer;
	import ashgame.EntityCreator;
	import ashgame.etc.TraverseResult;
	import ashgame.graphics.CircleView;
	import ashgame.nodes.MembranChainOrderedEntitiesNode;
	import ashgame.Utils;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class MembranChainOrderedEntitiesSystem extends ListIteratingSystem {
		public var creator:EntityCreator;
		
		public function MembranChainOrderedEntitiesSystem(creator:EntityCreator) {
			super(MembranChainOrderedEntitiesNode, updateNode);
			this.creator = creator;
		
		}
		
		private function updateNode(node:MembranChainOrderedEntitiesNode, time:Number):void {
			var start:Entity = null;
			if (node.membranChain.circular) {
				start = Entity(Utils.getIthKey(node.membranChain.partEntities, 0));
			} else {
				// get tail of membran chain
				var results:TraverseResult = MembranSystem.traverseMembranChain(Entity(Utils.getIthKey(node.membranChain.partEntities, 0)), function(current:Entity, accumulator:Object, visited:Dictionary):void {
						if (accumulator == null) {
							accumulator = new Dictionary();
							accumulator["tail"] = null;
						}
						accumulator["tail"] = current;
					}, new Dictionary());
				start = Entity(results.accumulator["tail"]); // one of the tails
			}
			//trace("blob", start);
			if (start) {
				
				// clean old ordered list
				node.orderedEntities.ordered.splice(0, node.orderedEntities.ordered.length);
				// traverse from start and put all walked entities in ordered list
				MembranSystem.traverseMembranChain(start, function(current:Entity, accumulator:Object, visited:Dictionary):void {
						node.orderedEntities.ordered.push(current);
						
						//just for fun and debugging add visuals when order updated
						var time:Number = 1;
						var circle:Entity = creator.createCircle(10, 0xBCE8FF, 0.6);
						var display:Display = Display(circle.get(Display));
						circle.add(new Anchor(current));
						circle.add(new Lifetime(time));
						circle.add(new Timer());
						circle.add(new Redrawing(CircleView(display.displayObject)));
						circle.add(new AlphaTween(0, time));
					}, null);
			}
			node.entity.remove(MembranChainUpdateOrderedEntities);
		}
	}

}