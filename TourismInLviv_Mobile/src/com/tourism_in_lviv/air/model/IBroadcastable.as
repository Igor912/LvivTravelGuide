package com.tourism_in_lviv.air.model
{
	import org.osflash.signals.ISignal;

	public interface IBroadcastable extends ISignal
	{
		function set value( val:Object ):void;
		function get value():Object;
		function broadcast():void;
		function stopNextPropagation():void;
	}
}
