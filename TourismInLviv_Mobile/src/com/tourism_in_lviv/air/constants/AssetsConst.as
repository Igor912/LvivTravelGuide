package com.tourism_in_lviv.air.constants
{
	/**
	 * 
	 * @author Ihor Khomiak
	 */
	public class AssetsConst
	{
		[Embed(source="/json/document.json", mimeType="application/octet-stream")]
		/**
		 * 
		 * @default 
		 */
		public static const JSON:Class;
		
		[Embed(source="/icons/back.png")]
		/**
		 * 
		 * @default 
		 */
		public static const ICON_BACK:Class;

		[Embed(source="/icons/categorys.png")]
		/**
		 * 
		 * @default 
		 */
		public static const ICON_CATEGORYS:Class;

		[Embed(source="/icons/settings.png")]
		/**
		 * 
		 * @default 
		 */
		public static const ICON_SETTINGS:Class;

		[Embed(source="/icons/info.png")]
		/**
		 * 
		 * @default 
		 */
		public static const ICON_INFO:Class;
		
		[Embed(source="/images/Backgrounds/logo.png")]
		/**
		 * 
		 * @default 
		 */
		public static const PICTURE_LOGO:Class;

		[Embed(source="/images/Backgrounds/logo_label.png")]
		/**
		 * 
		 * @default 
		 */
		public static const PICTURE_LOGO_LABEL:Class;
	}
}
