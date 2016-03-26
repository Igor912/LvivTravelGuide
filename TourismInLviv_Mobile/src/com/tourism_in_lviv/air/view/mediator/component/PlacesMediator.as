package com.tourism_in_lviv.air.view.mediator.component
{	
	import com.tourism_in_lviv.air.constants.ViewConst;
	import com.tourism_in_lviv.air.model.ModelLocator;
	import com.tourism_in_lviv.air.model.modelino.DataInfoModelLocator;
	import com.tourism_in_lviv.air.utils.CollectionUtils;
	import com.tourism_in_lviv.air.view.ui.popup.ComponentOptionsCallout;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	import spark.events.PopUpEvent;
	import spark.transitions.SlideViewTransition;
	
	import views.PlacesView;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class PlacesMediator extends Mediator
	{
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var view:PlacesView;
		
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var dataInfoModel:DataInfoModelLocator;
		
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var modelLocator:ModelLocator;
		
		private var touchBegin_X:int;
		
		/**
		 * 
		 * @default 
		 */
		public var optionsCallout:ComponentOptionsCallout = new ComponentOptionsCallout();
		
		/**
		 * 
		 */
		public function PlacesMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dataInfoModel.allPlacesSignal.add( getAllPlacesCollection_ResultHandler );
			dataInfoModel.placeCategorysSignal.add( getCategorysCollection_ResultHandler );
			
			view.placesList.addEventListener( IndexChangeEvent.CHANGE, placesList_IndexChangeHandler );
			view.btnCategory.addEventListener( MouseEvent.CLICK, btnCategory_clickHandler );
			view.btnOptions.addEventListener( MouseEvent.CLICK, btnOptions_clickHandler );
			view.addEventListener( TouchEvent.TOUCH_BEGIN, touch_BeginHandler );
			view.addEventListener( TouchEvent.TOUCH_END, touch_EndHandler );
			
			if( view.selectedCategory )    // if user changed selectedCategory on selected view than ti will set this new value to modelLocator.selectedCategory
				modelLocator.selectedPlaceCategory = view.selectedCategory;
			
			if( modelLocator.selectedPlaceCategory )
				view.placesList.dataProvider = modelLocator.selectedPlaceCategory.items;
		}
		
		override public function onRemove():void
		{
			view.placesList.removeEventListener( IndexChangeEvent.CHANGE, placesList_IndexChangeHandler );
			view.btnCategory.removeEventListener( MouseEvent.CLICK, btnCategory_clickHandler );
			view.btnOptions.removeEventListener( MouseEvent.CLICK, btnOptions_clickHandler );
			view.removeEventListener( TouchEvent.TOUCH_BEGIN, touch_BeginHandler );
			view.removeEventListener( TouchEvent.TOUCH_END, touch_EndHandler );
		}
		
		/**
		 * 
		 * @param event
		 */
		public function timerHandler(event:TimerEvent):void 
		{
			view.dispatchEvent(new Event('PlaceMediatorRegistered', true, true));
		}
		
		/**
		 * 
		 * @param event
		 */
		protected function placesList_IndexChangeHandler( event:IndexChangeEvent ):void
		{
			view.navigator.pushView( views.DescriptionView, {selectedItem: view.selectedPlace, selectedIndex:view.selectedPlaceIndex} ); //moving to Description view
		}

		/**
		 * 
		 * @param event
		 */
		protected function btnOptions_clickHandler( event:Event ):void
		{
			optionsCallout.addEventListener(PopUpEvent.CLOSE, optionsCalloutCloseHandler);   // Add an event handler for the close event to check for any returned data
			optionsCallout.open(view.btnOptions, true);    // Open as a modal callout
		}
		
		/**
		 * 
		 * @param event
		 */
		protected function optionsCalloutCloseHandler(event:PopUpEvent):void      // Handle the close event from the Callout
		{
			if (!event.commit)   // If commit is false, no data is returned
				return;
			
			if( event.data == ViewConst.LIST_SORTING_NAME )
				CollectionUtils.sortByProperty( view.placesList.dataProvider as ArrayCollection, 'name' );
			else if ( event.data == ViewConst.LIST_SORTING_RANDOM )
				view.placesList.dataProvider = new ArrayCollection(( view.placesList.dataProvider as ArrayCollection ).toArray().sort( CollectionUtils.mixArray ));
			else if ( event.data == ViewConst.LIST_SORTING_ASCENDING )
				CollectionUtils.sortByProperty( view.placesList.dataProvider as ArrayCollection, 'name', false );
			else if ( event.data == ViewConst.LIST_SORTING_DESCENDING )
				CollectionUtils.sortByProperty( view.placesList.dataProvider as ArrayCollection, 'name', true );
				
			optionsCallout.removeEventListener(PopUpEvent.CLOSE, optionsCalloutCloseHandler);
		} 
		
		/**
		 * 
		 * @param event
		 */
		protected function btnCategory_clickHandler( event:Event ):void
		{
			moveToCategoryView();
		}
		
		/**
		 * 
		 * @param event
		 */
		protected function touch_BeginHandler( event:TouchEvent ):void
		{
			touchBegin_X = event.localX; //save begin X point
		}
		
		/**
		 * 
		 * @param event
		 */
		protected function touch_EndHandler( event:TouchEvent ):void
		{
			if( touchBegin_X >= 0 && touchBegin_X <= 7 )  //if user touch screen and move on it from left to right (from any number from "0 to 7" to 100 px)
			{
				if( event.localX >= 100 )
					moveToCategoryView();
			}
		}
		
		private function moveToCategoryView():void
		{
			var transition:SlideViewTransition = new SlideViewTransition();
			transition.direction = 'right';
			view.navigator.pushView( views.CategoryView, new ArrayCollection( [dataInfoModel.placeCategorys, modelLocator.selectedPlaceCategory] ), null, transition); //moving to CategoryView and sending there category collection and selectedCategory from models
		}
		
		private function getCategorysCollection_ResultHandler( collection:ArrayCollection ):void
		{
		}

		private function getAllPlacesCollection_ResultHandler( collection:ArrayCollection ):void
		{
			view.placesList.dataProvider = collection;
		}
	}
}
