package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Attractable;
	import ashgame.components.Motion;
	import ashgame.components.Position;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class AttractableNode extends Node {
		public var attractable:Attractable;
		public var position:Position;
		public var motion:Motion;
	}

}