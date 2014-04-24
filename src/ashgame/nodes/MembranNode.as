package ashgame.nodes {
	import ash.core.Node;
	import ashgame.components.Audio;
	import ashgame.components.Membran;
	import ashgame.components.MembranChain;
	import ashgame.components.Radar;
	
	public class MembranNode extends Node {
		public var radar:Radar;
		public var membran:Membran;
		public var audio:Audio;
	}

}