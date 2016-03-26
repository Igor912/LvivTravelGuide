package com.tourism_in_lviv.air.events
{
	import flash.events.Event;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class ResultEvent extends Event
	{
		/**
		 * 
		 * @default 
		 */
		public static const GET_JSON_DATA:String = "getJsonData.ResultEvent";

		/**
		 * 
		 * @param type
		 * @param result
		 * @param bubbles
		 * @param cancelable
		 */
		public function ResultEvent( type:String, result:Object = null, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			_result = result;
		}

		private var _result:Object;

		override public function clone():Event
		{
			return new ResultEvent( type, result, bubbles, cancelable )
		}

		/**
		 * 
		 * @return 
		 */
		public function get result():Object
		{
			return _result.result;
		}
	}
}


