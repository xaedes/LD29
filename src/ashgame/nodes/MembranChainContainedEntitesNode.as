package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Collision;
	import ashgame.components.MembranChain;
	import ashgame.components.MembranChainOrderedEntities;
	
	public class MembranChainContainedEntitesNode extends Node {
		
		public var membranChain:MembranChain;
		public var membranChainOrderedEntities:MembranChainOrderedEntities;
		public var collision:Collision;
	
	}

}