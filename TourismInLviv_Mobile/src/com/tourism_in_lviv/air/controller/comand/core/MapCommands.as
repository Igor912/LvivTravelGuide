package com.tourism_in_lviv.air.controller.comand.core
{
	import com.tourism_in_lviv.air.controller.comand.MappingCommand;
	import com.tourism_in_lviv.air.controller.comand.json.CommandGetJSON;
	import com.tourism_in_lviv.air.controller.comand.json.signals.SignalGetJSON;

	import flash.events.Event;

	import org.robotlegs.base.ContextEvent;

	public class MapCommands extends MappingCommand
	{
		override public function execute():void
		{
			signalCommandMap.mapSignalClass(SignalGetJSON, CommandGetJSON);
		}
	}
}
