package com.tourism_in_lviv.air.model.modelino
{
	import com.tourism_in_lviv.air.model.IBroadcastable;
	import com.tourism_in_lviv.air.model.VOSignalProperty;
	
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.Signal;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class DataInfoModelLocator extends Signal
	{
		/**
		 * 
		 * @param parameters
		 */
		public function DataInfoModelLocator( ... parameters )
		{
			super( parameters );

			placeCategorysSignal = new VOSignalProperty();
			factCategorysSignal = new VOSignalProperty();
			allPlacesSignal = new VOSignalProperty();
			allFactsSignal = new VOSignalProperty();
			infoSignal = new VOSignalProperty();
		}
		
		/**
		 * 
		 * @default 
		 */
		public var placeCategorysSignal:IBroadcastable;
		/**
		 * 
		 * @default 
		 */
		public var factCategorysSignal:IBroadcastable;
		/**
		 * 
		 * @default 
		 */
		public var allPlacesSignal:IBroadcastable;
		/**
		 * 
		 * @default 
		 */
		public var allFactsSignal:IBroadcastable;
		/**
		 * 
		 * @default 
		 */
		public var infoSignal:IBroadcastable;

		/**
		 * 
		 * @return 
		 */
		public function get allPlaces():ArrayCollection
		{
			if ( !allPlacesSignal.value )
			{
				allPlacesSignal.value = new ArrayCollection();
			}
			return allPlacesSignal.value as ArrayCollection;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set allPlaces( value:ArrayCollection ):void
		{
			allPlacesSignal.value = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get allFacts():ArrayCollection
		{
			if ( !allFactsSignal.value )
			{
				allFactsSignal.value = new ArrayCollection();
			}
			return allFactsSignal.value as ArrayCollection;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set allFacts( value:ArrayCollection ):void
		{
			allFactsSignal.value = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get info():String
		{
			return infoSignal.value as String;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set info( value:String ):void
		{
			infoSignal.value = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get placeCategorys():ArrayCollection
		{
			if ( !placeCategorysSignal.value )
			{
				placeCategorysSignal.value = new ArrayCollection();
			}
			return placeCategorysSignal.value as ArrayCollection;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set placeCategorys( value:ArrayCollection ):void
		{
			placeCategorysSignal.value = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get factCategorys():ArrayCollection
		{
			if ( !factCategorysSignal.value )
			{
				factCategorysSignal.value = new ArrayCollection();
			}
			return factCategorysSignal.value as ArrayCollection;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set factCategorys( value:ArrayCollection ):void
		{
			factCategorysSignal.value = value;
		}
	}
}
