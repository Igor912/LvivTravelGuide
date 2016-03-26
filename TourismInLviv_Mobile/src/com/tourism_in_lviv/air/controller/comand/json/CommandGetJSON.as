package com.tourism_in_lviv.air.controller.comand.json
{
	import com.tourism_in_lviv.air.constants.AssetsConst;
	import com.tourism_in_lviv.air.controller.comand.base.CommandWebServiceBase;
	import com.tourism_in_lviv.air.model.ModelLocator;
	import com.tourism_in_lviv.air.model.dto.CategoryDTO;
	import com.tourism_in_lviv.air.model.modelino.DataInfoModelLocator;
	import com.tourism_in_lviv.air.model.signal.SignalParams;
	import com.tourism_in_lviv.air.net.async.IPromise;
	import com.tourism_in_lviv.air.net.async.Promise;
	import com.tourism_in_lviv.air.utils.CollectionUtils;
	import com.tourism_in_lviv.air.utils.DTOUtils;
	
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class CommandGetJSON extends CommandWebServiceBase
	{
		/*[Inject]
		public var service:ITaskService;*/
		
		[Inject]
		/**
		 * 
		 * @default 
		 */
		public var signalParams:SignalParams;
		
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
		
		private var JSONObject:Object;
		
		override public function execute():void
		{
			super.execute();
			
			handleResult(new Promise());
		}
		
		override protected function handleError( promise:IPromise ):void
		{
			super.handleError( promise );
		}
		
		override protected function handleResult( promise:IPromise ):void
		{
			JSONObject = loadJSON( AssetsConst.JSON );
			
			if( JSONObject && JSONObject.Places && JSONObject.PlaceCategories )
			{
				var places:ArrayCollection = DTOUtils.objectsCollToPlaceDTOColl( new ArrayCollection( JSONObject.Places ));
				var placeCategories:ArrayCollection = DTOUtils.objectsCollToCategoryDTOColl( new ArrayCollection( JSONObject.PlaceCategories ));
				
				for each (var placeCategory:CategoryDTO in placeCategories) 
				{
					placeCategory.items = CollectionUtils.filterArrayCollectionByStringTag( places, placeCategory.label );
				}
				
				//creating and adding allPlaces category to category model
				var allPlacesCategoryDTO:CategoryDTO = new CategoryDTO();
				allPlacesCategoryDTO.categoryName = 'AllPlaces';
				allPlacesCategoryDTO.label = 'Усі Місця Львова';
				allPlacesCategoryDTO.items = places;
				placeCategories.addItemAt( allPlacesCategoryDTO, 0 );
				
				modelLocator.selectedPlaceCategory = allPlacesCategoryDTO;
				
				dataInfoModel.placeCategorys = placeCategories;
				dataInfoModel.allPlaces = places;
			}
			
			if( JSONObject && JSONObject.Facts && JSONObject.FactsCategories )
			{
				var facts:ArrayCollection = DTOUtils.objectsCollToFactDTOColl( new ArrayCollection( JSONObject.Facts ));
				var factsCategorys:ArrayCollection = DTOUtils.objectsCollToCategoryDTOColl( new ArrayCollection( JSONObject.FactsCategories ));
				for each (var factCategory:CategoryDTO in factsCategorys) 
				{
					factCategory.items = CollectionUtils.filterArrayCollectionByStringTag( facts, factCategory.label );
				}
				
				//creating and adding allPlaces category to category model
				var allFactsCategoryDTO:CategoryDTO = new CategoryDTO();
				allFactsCategoryDTO.categoryName = 'AllFacts';
				allFactsCategoryDTO.label = 'Усі цікавинки про Львів';
				allFactsCategoryDTO.items = facts;
				factsCategorys.addItemAt( allFactsCategoryDTO, 0 );
				
				modelLocator.selectedFactCategory = allFactsCategoryDTO;
				
				dataInfoModel.factCategorys = factsCategorys;
				dataInfoModel.allFacts = facts;
			}
			
			if( JSONObject && JSONObject.Info )
			{
				dataInfoModel.info = JSONObject.Info;
			}

			super.handleResult( promise );
		}
		
		/**
		 * 
		 * @param Embedded
		 * @return 
		 */
		public function loadJSON(Embedded:Class):Object
		{
			var bytes:ByteArray = new Embedded() as ByteArray;
			return JSON.parse(bytes.readUTFBytes(bytes.length));
		}
	}
}