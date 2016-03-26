package com.tourism_in_lviv.air.model.dto
{
	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class ImagePathDTO
	{
		private var _path:String='';
		private var _path_130:String='';
		private var _path_480:String='';

		/**
		 * 
		 * @return 
		 */
		public function get path_480():String
		{
			return _path_480;
		}

		/**
		 * 
		 * @param value
		 */
		public function set path_480(value:String):void
		{
			_path_480 = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get path_130():String
		{
			return _path_130;
		}

		/**
		 * 
		 * @param value
		 */
		public function set path_130(value:String):void
		{
			_path_130 = value;
		}

		/**
		 * 
		 * @return 
		 */
		public function get path():String
		{
			return _path;
		}

		/**
		 * 
		 * @param value
		 */
		public function set path(value:String):void
		{
			_path = value;
		}

	}
}