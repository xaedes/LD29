package ashgame.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Dictionary;
	import ashgame.Assets;
	import ashgame.components.AlphaTween;
	import ashgame.components.Anchor;
	import ashgame.components.Audio;
	import ashgame.components.CircleCircleCollision;
	import ashgame.components.Display;
	import ashgame.components.EnergyStorage;
	import ashgame.components.EnergyStorageWarning;
	import ashgame.components.Lifetime;
	import ashgame.components.Mover;
	import ashgame.components.Position;
	import ashgame.components.Size;
	import ashgame.components.Timer;
	import ashgame.EntityCreator;
	import ashgame.graphics.TextView;
	import ashgame.nodes.GameStateNode;
	import ashgame.nodes.MembranChainNode;
	import ashgame.Utils;
	import org.as3commons.reflect.Method;
	import org.as3commons.reflect.Type;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class GameManager extends System {
		private var creator:EntityCreator;
		private var engine:Engine;
		private var game:GameStateNode;
		private var entities:Dictionary = new Dictionary();
		private var membranChainNodes:NodeList = null;
		private var reflectionType:Type;
		
		public function GameManager(creator:EntityCreator) {
			this.creator = creator;
			this.reflectionType = Type.forInstance(this);
		}
		
		override public function addToEngine(engine:Engine):void {
			this.engine = engine;
			var gameNodeList:NodeList = engine.getNodeList(GameStateNode);
			if (!gameNodeList.empty) {
				game = gameNodeList.head;
			} else {
				game = GameStateNode(ComponentMatchingFamily(engine.getFamily(GameStateNode)).nodeByEntity(engine.getEntityByName("game")));
				
				if (!game) {
					game = null;
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			game = null;
		}
		
		public function state_start_init(time:Number):void {
			var position:Position;
			var display:Display;
			var textView:TextView;
			var size:Size;
			
			entities["cave_tile"] = creator.createCaveTile(0, 0);
			
			game.gameState.initialized = true;
		}
		
		internal function blendOutEntity(entity:Entity, t:Number = 1):void {
			entity.add(new Timer());
			entity.add(new Lifetime(t));
			entity.add(new AlphaTween(0, t));
		}
		
		public function state_start(time:Number):void {
			game.gameState.state = "alive";
		}
		
		public function state_alive_init(time:Number):void {
			creator.createCaveTile(0, 0);
			game.gameState.initialized = true;
		}
		
		public function state_alive(time:Number):void {
		/* empty */
		}
		
		override public function update(time:Number):void {
			var display:Display;
			
			if (game) {
				if (game.gameState.state == "") {
					game.gameState.state = "start";
				}
				var method_name:String = "state_" + game.gameState.state;
				if (!game.gameState.initialized) {
					var method_init_name:String = method_name + "_init";
					var state_init_handler:Method = this.reflectionType.getMethod(method_init_name);
					if (state_init_handler) {
						state_init_handler.invoke(this, [time]);
					} else {
						// no init handler, so skip initialization
						game.gameState.initialized = true;
					}
				}
				var state_handler:Method = this.reflectionType.getMethod(method_name);
				if (state_handler) {
					state_handler.invoke(this, [time]);
				} else {
					throw new Error("game state handler for state '" + method_name + "' not implemented");
				}
				
			}
		}
	
	}

}