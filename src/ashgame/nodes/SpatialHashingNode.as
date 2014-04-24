package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Position;
	import ashgame.components.Size;
	import ashgame.components.SpatialHashed;
	
	public class SpatialHashingNode extends Node {
		public var spatialHashed:SpatialHashed;
		public var position:Position;
		public var size:Size;
	}
}
