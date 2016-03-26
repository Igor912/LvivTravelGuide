package com.tourism_in_lviv.air.view.mediator.component
{	
	import com.tourism_in_lviv.air.model.modelino.DataInfoModelLocator;
	
	import org.robotlegs.mvcs.Mediator;
	
	import views.InfoView;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class InfoMediator extends Mediator
	{
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var view:InfoView;
		
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var dataInfoModel:DataInfoModelLocator;
		
		/**
		 * 
		 */
		public function InfoMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			view.labelMainInfo.text = dataInfoModel.info;
		}
		
		override public function onRemove():void
		{
		}
	}
}
