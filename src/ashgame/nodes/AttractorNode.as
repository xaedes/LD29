package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Attracting;
	import ashgame.components.Attractor;
	import ashgame.components.Circle;
	import ashgame.components.Collision;
	import ashgame.components.Position;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class AttractorNode extends Node {
		public var attracting:Attracting;
		public var attractor:Attractor;
		public var position:Position;
		public var collision:Collision;
		public var circle:Circle;
	}

}