package com.tourism_in_lviv.air.view.skin
{
	import spark.skins.mobile.ActionBarSkin;
	
	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class ComponentActionBarSkin extends ActionBarSkin
	{
		/**
		 * 
		 */
		public function ComponentActionBarSkin()
		{
			super();
			borderClass = null;
			
			
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			var chromeColor:uint = getStyle("chromeColor");
			var backgroundAlphaValue:Number = getStyle("backgroundAlpha");
			
			graphics.beginFill(chromeColor, backgroundAlphaValue);
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
		}
	}
}