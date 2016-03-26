package com.tourism_in_lviv.air.interfaces
{
	import com.tourism_in_lviv.air.model.dto.ImagePathDTO;

	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public interface IFactDTO
	{
		function get name():String;
		
		function set name( value:String ):void;

		function get description():String;
		
		function set description( value:String ):void;
		
		function get pathToImage():ImagePathDTO;
		
		function set pathToImage( value:ImagePathDTO ):void;
	}
}