package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Display;
	import ashgame.components.MembranChain;
	import ashgame.components.MembranChainSpatialUpdate;
	import ashgame.components.Position;
	import ashgame.components.Size;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class MembranChainSpatialUpdateNode extends Node {
		public var membranChainSpatialUpdate:MembranChainSpatialUpdate;
		public var membranChain:MembranChain;
		public var position:Position;
		public var size:Size;
		public var display:Display;
	
	}

}