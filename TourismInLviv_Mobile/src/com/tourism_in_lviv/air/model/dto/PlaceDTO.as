package com.tourism_in_lviv.air.model.dto
{
	import com.tourism_in_lviv.air.interfaces.IPlaceDTO;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class PlaceDTO implements IPlaceDTO
	{
		private var _name:String='';
		private var _categoryTags:String='';
		private var _shortDescription:String='';
		private var _longDescription:String='';
		private var _address:String='';
		private var _pathToImage:ImagePathDTO;

		/**
		 * 
		 * @return 
		 */
		public function get categoryTags():String
		{
			return _categoryTags;
		}

		/**
		 * 
		 * @param value
		 */
		public function set categoryTags(value:String):void
		{
			_categoryTags = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get pathToImage():ImagePathDTO
		{
			return _pathToImage;
		}

		/**
		 * 
		 * @param value
		 */
		public function set pathToImage(value:ImagePathDTO):void
		{
			_pathToImage = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get address():String
		{
			return _address;
		}

		/**
		 * 
		 * @param value
		 */
		public function set address(value:String):void
		{
			_address = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get longDescription():String
		{
			return _longDescription;
		}

		/**
		 * 
		 * @param value
		 */
		public function set longDescription(value:String):void
		{
			_longDescription = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get shortDescription():String
		{
			return _shortDescription;
		}

		/**
		 * 
		 * @param value
		 */
		public function set shortDescription(value:String):void
		{
			_shortDescription = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get name():String
		{
			return _name;
		}

		/**
		 * 
		 * @param value
		 */
		public function set name(value:String):void
		{
			_name = value;
		}

	}
}