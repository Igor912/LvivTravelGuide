package com.tourism_in_lviv.air.controller.comand.core
{
	import com.tourism_in_lviv.air.controller.comand.MappingCommand;
	import com.tourism_in_lviv.air.view.mediator.component.ComponentHomeMediator;
	import com.tourism_in_lviv.air.view.mediator.component.FactsMediator;
	import com.tourism_in_lviv.air.view.mediator.component.InfoMediator;
	import com.tourism_in_lviv.air.view.mediator.component.PlacesMediator;
	import com.tourism_in_lviv.air.view.ui.component.ComponentHomeView;
	
	import views.FactsView;
	import views.InfoView;
	import views.PlacesView;
	
	public class MapViews extends MappingCommand
	{
		override public function execute():void
		{
			mapComponents();
			mapContainers();
			mapControls();
			mapRenderers();
		}
		
		private function mapComponents():void
		{
			mediatorMap.mapView( PlacesView, PlacesMediator );
			mediatorMap.mapView( FactsView, FactsMediator );
			mediatorMap.mapView( InfoView, InfoMediator );
			mediatorMap.mapView( ComponentHomeView, ComponentHomeMediator );
		}
		
		private function mapContainers():void
		{
			
		}
		
		private function mapControls():void
		{
			
		}
		
		private function mapRenderers():void
		{
			
		}
	}
}