package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Attracting;
	import ashgame.components.Attractor;
	import ashgame.components.AttractorController;
	import ashgame.components.StateMachine;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class AttractorControllerNode extends Node {
		public var attractorController:AttractorController;
		public var attractor:Attractor;
		public var stateMachine:StateMachine;
	
	}

}