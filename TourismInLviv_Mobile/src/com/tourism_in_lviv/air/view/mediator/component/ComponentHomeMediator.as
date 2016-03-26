package com.tourism_in_lviv.air.view.mediator.component
{	
	import com.tourism_in_lviv.air.controller.comand.json.signals.SignalGetJSON;
	import com.tourism_in_lviv.air.model.modelino.DataInfoModelLocator;
	import com.tourism_in_lviv.air.model.signal.SignalParams;
	import com.tourism_in_lviv.air.view.ui.component.ComponentHomeView;
	
	import org.robotlegs.mvcs.Mediator;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class ComponentHomeMediator extends Mediator
	{
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var signalGetJSON:SignalGetJSON;

		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var view:ComponentHomeView;
		
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var dataInfoModel:DataInfoModelLocator;

		override public function onRegister():void
		{
			getJSONData( new SignalParams( "param", "json" ));
		}
		
		override public function onRemove():void
		{
		}
		
		private function getJSONData( params:SignalParams ):void
		{
			signalGetJSON.dispatch( params, null );
		}
	}
}
