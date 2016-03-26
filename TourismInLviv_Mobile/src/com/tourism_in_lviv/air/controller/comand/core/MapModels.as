package com.tourism_in_lviv.air.controller.comand.core
{
	import com.tourism_in_lviv.air.controller.comand.MappingCommand;
	import com.tourism_in_lviv.air.model.ModelLocator;
	import com.tourism_in_lviv.air.model.modelino.DataInfoModelLocator;

	public class MapModels extends MappingCommand
	{
		override public function execute():void
		{
			injector.mapSingleton( DataInfoModelLocator );
			injector.mapSingleton( ModelLocator );
		}
	}
}