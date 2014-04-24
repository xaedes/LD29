package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyStorage;
	import ashgame.components.Motion;
	import ashgame.components.KeyboardMotionControls;
	import ashgame.components.Mover;
	import ashgame.components.Position;
	
	public class KeyboardMotionControlNode extends Node {
		public var control:KeyboardMotionControls;
		public var position:Position;
		public var motion:Motion;
		public var energyStorage:EnergyStorage;
		public var mover:Mover;
	}
}
