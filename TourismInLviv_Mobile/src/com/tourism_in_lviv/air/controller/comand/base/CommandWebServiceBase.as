package com.tourism_in_lviv.air.controller.comand.base
{
	import com.tourism_in_lviv.air.net.async.IPromise;
	
	import flash.external.ExternalInterface;
	
	import mx.rpc.events.FaultEvent;
	
	import org.robotlegs.mvcs.SignalCommand;

	public class CommandWebServiceBase extends SignalCommand
	{
		override public function execute():void
		{
			commandMap.detain( this );
			//onunloadApp();
		}

		protected function handleError( promise:IPromise ):void
		{
			dispatch( new FaultEvent( FaultEvent.FAULT, promise.error ));
			commandMap.release( this );
			var error:FaultEvent = promise.error;
			//var errorString:String = error && error.fault && error.fault.faultString ? error.fault.faultString : this + '.handleError ()';
			var errorString:String = error && error.fault && error.fault.rootCause && error.fault.rootCause.hasOwnProperty( 'message' ) ? error.fault.rootCause.message as String : error.fault.faultString;
			var errorCode:String = error && error.fault && error.fault.faultCode ? error.fault.faultCode : "";
			var errorDetail:String = error && error.fault && error.fault.faultDetail ? error.fault.faultDetail : "";

			switch ( errorString )
			{
				case "com.inspird.exception.InspirdException : Not Authenticated!":
				{
					errorString = "Your session has timed out.  Please start a new session!";
				}
			}

			switch ( errorCode )
			{
				case "Server.Processing.DuplicateSessionDetected":
				{
					break;
				}
			}

			if ( errorDetail.indexOf( "Status 404" ) > 0 || errorDetail.indexOf( "Status 500" ) > 0 || errorDetail.indexOf( "Status 503" ) > 0 )
			{
			}
		}

		protected function handleResult( promise:IPromise ):void
		{
			commandMap.release( this );
		}
	}
}

