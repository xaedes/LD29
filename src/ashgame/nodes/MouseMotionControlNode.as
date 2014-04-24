package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.EnergyStorage;
	import ashgame.components.Motion;
	import ashgame.components.MouseMotionControls;
	import ashgame.components.Mover;
	import ashgame.components.Position;
	
	public class MouseMotionControlNode extends Node {
		public var control:MouseMotionControls;
		public var position:Position;
		public var motion:Motion;
		public var energyStorage:EnergyStorage;
		public var mover:Mover;
	}
}
