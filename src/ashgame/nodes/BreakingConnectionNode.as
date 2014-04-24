package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Breakable;
	import ashgame.components.DistanceConstraint;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class BreakingConnectionNode extends Node {
		public var breakable:Breakable;
		public var distanceConstraint:DistanceConstraint;
	}

}