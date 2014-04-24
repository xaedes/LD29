package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.MembranChain;
	import ashgame.components.MembranChainOrderedEntities;
	import ashgame.components.MembranChainUpdateOrderedEntities;
	
	public class MembranChainOrderedEntitiesNode extends Node {
		public var updateOrderedEntities:MembranChainUpdateOrderedEntities;
		public var orderedEntities:MembranChainOrderedEntities;
		public var membranChain:MembranChain;
	}

}