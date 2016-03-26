package com.tourism_in_lviv.air.controller.comand.base.signal
{
	import com.tourism_in_lviv.air.model.signal.SignalParams;
	
	import mx.rpc.Responder;
	
	import org.osflash.signals.Signal;

	public class SignalBase extends Signal
	{
		public function SignalBase()
		{
			super( com.tourism_in_lviv.air.model.signal.SignalParams, Responder );
		}
	}
}

