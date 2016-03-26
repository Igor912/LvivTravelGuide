package com.tourism_in_lviv.air.model.common
{

	public interface IObjectPool
	{
		function disposeObject(object:Object):void;
		function getObject():*;
	}
}
