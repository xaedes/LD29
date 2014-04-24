package ashgame {
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.DisplayObjectContainer;
	import ashgame.components.CircleCircleCollision;
	import ashgame.input.KeyPoll;
	import ashgame.input.MousePoll;
	import ashgame.systems.AlphaTweenSystem;
	import ashgame.systems.AnchorSystem;
	import ashgame.systems.AttractorControllerSystem;
	import ashgame.systems.AttractorSystem;
	import ashgame.systems.AudioSystem;
	import ashgame.systems.AutoResizingRectViewSystem;
	import ashgame.systems.AutosizeSystem;
	import ashgame.systems.BreakingConnectionSystem;
	import ashgame.systems.CircleCircleCollisionSystem;
	import ashgame.systems.CollisionWithSpatialHashingSystem;
	import ashgame.systems.DistanceConstraintSystem;
	import ashgame.systems.EnergyCollectingCollisionSystem;
	import ashgame.systems.EnergyProducerSystem;
	import ashgame.systems.EnergyStorageEmitterSystem;
	import ashgame.systems.EnergyStorageViewSystem;
	import ashgame.systems.EnergyStorageWarningSystem;
	import ashgame.systems.FitCircleToSizeSystem;
	import ashgame.systems.FitSizeAroundOtherEntitySystem;
	import ashgame.systems.GameManager;
	import ashgame.systems.GravitySystem;
	import ashgame.systems.KeyboardMotionControlSystem;
	import ashgame.systems.LifetimeSystem;
	import ashgame.systems.MembranChainContainedEntitesSystem;
	import ashgame.systems.MembranChainOrderedEntitiesSystem;
	import ashgame.systems.MembranChainSpatialUpdateSystem;
	import ashgame.systems.MembranSystem;
	import ashgame.systems.MovementSystem;
	import ashgame.systems.PositionTweenSystem;
	import ashgame.systems.ProfilingSystem;
	import ashgame.systems.RedrawingSystem;
	import ashgame.systems.RenderSystem;
	import ashgame.systems.SolidCollisionSystem;
	import ashgame.systems.SpatialHashingSystem;
	import ashgame.systems.TimerSystem;
	import ashgame.systems.UpdateCircleViewSystem;
	import ashgame.systems.UpdateLabeledCircleSystem;
	import ashgame.systems.UpdateTextViewSystem;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class Game {
		private var container:DisplayObjectContainer;
		private var engine:Engine;
		private var tickProvider:FrameTickProvider;
		private var creator:EntityCreator;
		private var keyPoll:KeyPoll;
		private var mousePoll:MousePoll;
		private var config:GameConfig;
		
		public function Game(container:DisplayObjectContainer, width:Number, height:Number) {
			this.container = container;
			prepare(width, height);
		}
		
		// todo 
		// - add simple circle to be drawn
		//   - add entity for it
		//   - add movement
		
		private function prepare(width:Number, height:Number):void {
			engine = new Engine();
			keyPoll = new KeyPoll(container.stage);
			mousePoll = new MousePoll(container.stage);
			config = new GameConfig();
			config.width = width;
			config.height = height;
			creator = new EntityCreator(engine, config);
			
			// create game entity
			creator.createGame();
			
			// add systems 
			// todo: add priorites (CollisionSystem < SolidCollisionSystem, CollisionSystem < EnergyCollectingCollisionSystem)
			var spatialHashingSystem:SpatialHashingSystem = new SpatialHashingSystem(config, 10);
			var k:int = 0;
			engine.addSystem(new AutoResizingRectViewSystem(), k++);
			engine.addSystem(new RedrawingSystem(), k++);
			engine.addSystem(new MovementSystem(config), k++);
			engine.addSystem(new GravitySystem(), k++);
			engine.addSystem(new KeyboardMotionControlSystem(keyPoll), k++);
			//engine.addSystem(new MouseMotionControlSystem(mousePoll), k++);
			engine.addSystem(new EnergyStorageViewSystem(), k++);
			//engine.addSystem(new CollisionSystem(), 0);
			engine.addSystem(spatialHashingSystem, k++);
			engine.addSystem(new CollisionWithSpatialHashingSystem(spatialHashingSystem), k++);
			engine.addSystem(new CircleCircleCollisionSystem(), k++);
			engine.addSystem(new EnergyCollectingCollisionSystem(creator, config), k++);
			engine.addSystem(new SolidCollisionSystem(), k++);
			engine.addSystem(new EnergyStorageEmitterSystem(creator), k++);
			engine.addSystem(new AudioSystem(), k++);
			engine.addSystem(new EnergyProducerSystem(), k++);
			engine.addSystem(new MembranSystem(creator), k++);
			engine.addSystem(new DistanceConstraintSystem(), k++);
			engine.addSystem(new BreakingConnectionSystem(), k++);
			engine.addSystem(new TimerSystem(), k++);
			engine.addSystem(new LifetimeSystem(creator), k++);
			engine.addSystem(new AttractorSystem(), k++);
			engine.addSystem(new AttractorControllerSystem(keyPoll), k++);
			engine.addSystem(new GameManager(creator), k++);
			engine.addSystem(new AlphaTweenSystem(), k++);
			engine.addSystem(new PositionTweenSystem(), k++);
			engine.addSystem(new EnergyStorageWarningSystem(creator), k++);
			engine.addSystem(new AutosizeSystem(), k++);
			engine.addSystem(new MembranChainSpatialUpdateSystem(), k++);
			engine.addSystem(new MembranChainOrderedEntitiesSystem(creator), k++);
			engine.addSystem(new MembranChainContainedEntitesSystem(creator), k++);
			engine.addSystem(new FitSizeAroundOtherEntitySystem(), k++);
			engine.addSystem(new FitCircleToSizeSystem(), k++);
			engine.addSystem(new UpdateCircleViewSystem(), k++);
			engine.addSystem(new UpdateTextViewSystem(), k++);
			engine.addSystem(new UpdateLabeledCircleSystem(), k++);
			engine.addSystem(new AnchorSystem(), k++);
			engine.addSystem(new RenderSystem(container), k++);
			//engine.addSystem(new ProfilingSystem(), k++);
		
		}
		
		public function start():void {
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	}

}