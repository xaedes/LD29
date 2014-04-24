package ashgame.systems {
	import ash.core.Entity;
	import ash.tools.ListIteratingSystem;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import ashgame.components.Anchor;
	import ashgame.components.Display;
	import ashgame.components.EnergyStorageWarning;
	import ashgame.components.Position;
	import ashgame.EntityCreator;
	import ashgame.graphics.TextView;
	import ashgame.nodes.AlphaTweenNode;
	import ashgame.nodes.EnergyStorageWarningNode;
	
	public class EnergyStorageWarningSystem extends ListIteratingSystem {
		private var creator:EntityCreator;
		
		public function EnergyStorageWarningSystem(creator:EntityCreator) {
			super(EnergyStorageWarningNode, updateNode);
			this.creator = creator;
		}
		
		private function updateNode(node:EnergyStorageWarningNode, time:Number):void {
			var text:Entity;
			var textPosition:Position;
			
			if (node.energyStorage.energy / node.energyStorage.maxEnergy < node.energyStorageWarning.warningUnderPercent) {
				if (node.energyStorageWarning.countdown <= 0) {
					text = creator.createFloatingText("Energy low!", node.energyStorageWarning.fading_time);
					text.add(new Anchor(node.entity));
					var display:Display = Display(text.get(Display));
					var textView:TextView = TextView(display.displayObject);
					
					var format:TextFormat = new TextFormat();
					format.color = 0xFFB600;
					textView.textField.defaultTextFormat = format;
					
					node.energyStorageWarning.countdown = node.energyStorageWarning.interval;
				} else {
					node.energyStorageWarning.countdown -= time;
				}
			}
		
		}
	}
}
