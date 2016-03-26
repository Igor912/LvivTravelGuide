package com.tourism_in_lviv.air.utils
{
	import com.tourism_in_lviv.air.model.dto.CategoryDTO;
	import com.tourism_in_lviv.air.model.dto.FactDTO;
	import com.tourism_in_lviv.air.model.dto.ImagePathDTO;
	import com.tourism_in_lviv.air.model.dto.PlaceDTO;
	
	import mx.collections.ArrayCollection;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class DTOUtils
	{		
		/**
		 * 
		 * @param object
		 * @return 
		 */
		public static function objectToPlaceDTO( object:Object ):PlaceDTO
		{
			var placeDTO:PlaceDTO = new PlaceDTO();
			placeDTO.name = object.name;
			placeDTO.categoryTags = object.categoryTags;
			placeDTO.shortDescription = object.shortDescription;
			placeDTO.longDescription = object.longDescription;
			placeDTO.address = object.address;
			placeDTO.pathToImage = objectToImagePathDTO( object.pathToImage );
			return placeDTO;
		}
		
		/**
		 * 
		 * @param object
		 * @return 
		 */
		public static function objectToImagePathDTO( object:Object ):ImagePathDTO
		{
			if( object is String )
				return null;
			var imagePathDTO:ImagePathDTO = new ImagePathDTO();
			//imagePathDTO.path = object.path;
			imagePathDTO.path_130 = object.path_130;
			imagePathDTO.path_480 = object.path_480;
			return imagePathDTO;
		}
		
		/**
		 * 
		 * @param object
		 * @return 
		 */
		public static function objectToFactDTO( object:Object ):FactDTO
		{
			var factDTO:FactDTO = new FactDTO();
			factDTO.name = object.name;
			factDTO.categoryTags = object.categoryTags;
			factDTO.description = object.description;
			factDTO.pathToImage = objectToImagePathDTO( object.pathToImage );
			return factDTO;
		}
		
		/**
		 * 
		 * @param categoryObjectArray
		 * @return 
		 */
		public static function objectsCollToCategoryDTOColl( categoryObjectArray:ArrayCollection ):ArrayCollection
		{
			var categoryDTOArray:ArrayCollection = new ArrayCollection();
			for each (var categoryObject:Object in categoryObjectArray) 
			{
				var categoryDTO:CategoryDTO = new CategoryDTO();
				categoryDTO.categoryName = categoryObject.categoryName;
				categoryDTO.label = categoryObject.label;
				categoryDTOArray.addItem( categoryDTO );
			}
			
			return categoryDTOArray;
		}
		
		/**
		 * 
		 * @param placeObjectArray
		 * @return 
		 */
		public static function objectsCollToPlaceDTOColl( placeObjectArray:ArrayCollection ):ArrayCollection
		{
			var placeDTOArray:ArrayCollection = new ArrayCollection();
			for each (var placeObject:Object in placeObjectArray) 
			{
				var placeDTO:PlaceDTO = objectToPlaceDTO( placeObject );
				placeDTOArray.addItem( placeDTO );
			}
			
			return placeDTOArray;
		}
		
		/**
		 * 
		 * @param factObjectArray
		 * @return 
		 */
		public static function objectsCollToFactDTOColl( factObjectArray:ArrayCollection ):ArrayCollection
		{
			var factDTOArray:ArrayCollection = new ArrayCollection();
			for each (var factObject:Object in factObjectArray) 
			{
				var factDTO:FactDTO = objectToFactDTO( factObject );
				factDTOArray.addItem( factDTO );
			}
			
			return factDTOArray;
		}
	}
}
