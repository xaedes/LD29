package ashgame.systems {
	import ash.tools.ListIteratingSystem;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import ashgame.input.MousePoll;
	import ashgame.nodes.MouseMotionControlNode;
	import flash.events.MouseEvent;
	import ashgame.Utils;
	
	public class MouseMotionControlSystem extends ListIteratingSystem {
		private var mouse:MousePoll;
		
		public function MouseMotionControlSystem(mouse:MousePoll) {
			super(MouseMotionControlNode, updateNode);
			this.mouse = mouse;
		}
		
		private function updateNode(node:MouseMotionControlNode, time:Number):void {
			// move to mouse position
			var mousePos:Point = new Point(mouse.x, mouse.y);
			var diff:Point = mousePos.subtract(node.position.position);
			var diffLen:Number = diff.length;
			diff.normalize(1);
			
			if (!isNaN(diff.length)) {
				
				var accel:Point = Utils.mult(diff, node.control.accelerationRate * time * diffLen);
				//trace(accel.length);
				
				Utils.pointAdd(node.motion.velocity, accel);
			}
		
			//Utils.pointSet(node.position.position, mousePos);
		}
	}

}