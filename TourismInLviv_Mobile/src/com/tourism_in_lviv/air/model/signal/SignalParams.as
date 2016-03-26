package com.tourism_in_lviv.air.model.signal
{

	public class SignalParams
	{
		public var paramsHolder:Object = new Object();

		public function SignalParams( ... args )
		{
			for ( var i:uint = 0; i + 1 < args.length; i += 2 )
			{
				this.paramsHolder[ args[ i ]] = args[ i + 1 ];
			}
		}
	}
}

