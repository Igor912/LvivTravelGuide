package com.tourism_in_lviv.air.model.dto
{
	import com.tourism_in_lviv.air.interfaces.ICategoryDTO;
	
	import mx.collections.ArrayCollection;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class CategoryDTO implements ICategoryDTO
	{
		private var _categoryName:String='';
		private var _label:String='';
		private var _items:ArrayCollection=null;

		[ArrayElementType( "com.tourism_in_lviv.air.model.dto.PlaceDTO" )]
		/**
		 * 
		 * @return 
		 */
		public function get items():ArrayCollection
		{
			return _items;
		}

		/**
		 * 
		 * @param value
		 */
		public function set items(value:ArrayCollection):void
		{
			_items = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get label():String
		{
			return _label;
		}

		/**
		 * 
		 * @param value
		 */
		public function set label(value:String):void
		{
			_label = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get categoryName():String
		{
			return _categoryName;
		}

		/**
		 * 
		 * @param value
		 */
		public function set categoryName(value:String):void
		{
			_categoryName = value;
		}
	}
}