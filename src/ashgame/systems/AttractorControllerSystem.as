package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import ashgame.components.Anchor;
	import ashgame.components.Position;
	import ashgame.input.KeyPoll;
	import ashgame.nodes.AnchorNode;
	import ashgame.nodes.AttractorControllerNode;
	
	public class AttractorControllerSystem extends ListIteratingSystem {
		private var keyPoll:KeyPoll;
		
		public function AttractorControllerSystem(keyPoll:KeyPoll) {
			this.keyPoll = keyPoll;
			super(AttractorControllerNode, updateNode);
		}
		
		private function updateNode(node:AttractorControllerNode, time:Number):void {
			if (keyPoll.isDown(node.attractorController.activate)) {
				node.stateMachine.fsm.changeState("active");
			} else {
				node.stateMachine.fsm.changeState("inactive");
					//node.attractor.strength = 0;		
			}
		}
	}
}
