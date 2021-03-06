package com.tourism_in_lviv.air.services
{
	import com.tourism_in_lviv.air.services.signals.Failed;
	
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import org.osflash.signals.ISignal;

	public class AbstractUrlLoaderService
	{
		private var loader:URLLoader;
		private var request:URLRequest;
		private var url:String;
		private var _failed:Failed;
		private var urlParameters:Vector.<UrlParameter>;
		private var dynamicPaths:Vector.<String>;

		public function AbstractUrlLoaderService( url:String )
		{
			this.url = url;

			loader = new URLLoader();
			_failed = new Failed();
		}

		public function get success():ISignal
		{
			throw new IllegalOperationError( "Must be overridden in sub-class." );
		}

		public function get failure():ISignal
		{
			return _failed;
		}

		protected function makeGetRequest( encode:Boolean = true, cacheBust:Boolean = true ):void
		{
			var serviceUrl:ServiceUrl = new ServiceUrl( url, dynamicPaths, urlParameters, cacheBust );

			if ( encode )
			{
				var vars:URLVariables = new URLVariables( serviceUrl.parameters );
				request = new URLRequest( serviceUrl.baseUrl );
				request.data = vars;
			}
			else
			{
				request = new URLRequest( serviceUrl.toString());
			}

			request.method = URLRequestMethod.GET;
			addLoaderListeners();
			loader.load( request );
		}

		protected function makePostRequest( data:Object = null, encoding:String = null ):void
		{
			var serviceUrl:ServiceUrl = new ServiceUrl( url, dynamicPaths, urlParameters, false );

			request = new URLRequest( serviceUrl.toString());
			request.method = URLRequestMethod.POST;
			request.data = data;

			if ( encoding )
				request.contentType = encoding;

			addLoaderListeners();
			loader.load( request );
		}

		protected function successHandler( data:Object ):void
		{

		}

		protected function failureHandler( message:String ):void
		{
			dispatchFailure( message );
		}

		protected function dispatchFailure( message:String ):void
		{
			_failed.dispatch( message );
		}

		protected function setDynamicPaths( ... dynamicPaths ):void
		{
			this.dynamicPaths = Vector.<String>( dynamicPaths );
		}

		protected function setUrlParameters( parameters:Object ):void
		{
			urlParameters = new Vector.<UrlParameter>();

			for ( var parameter:String in parameters )
			{
				urlParameters.push( new UrlParameter( parameter, parameters[ parameter ]));
			}
		}

		private function completeHandler( event:Event ):void
		{
			removeLoaderListeners();
			successHandler( loader.data );
		}

		private function ioErrorHandler( event:IOErrorEvent ):void
		{
			removeLoaderListeners();
			failureHandler( "" );
		}

		private function securityErrorHandler( event:SecurityErrorEvent ):void
		{
			removeLoaderListeners();
			failureHandler( "" );
		}

		private function addLoaderListeners():void
		{
			loader.addEventListener( Event.COMPLETE, completeHandler );
			loader.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
			loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
		}

		private function removeLoaderListeners():void
		{
			loader.removeEventListener( Event.COMPLETE, completeHandler );
			loader.removeEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
			loader.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
		}
	}
}

