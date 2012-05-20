package de.creativetechnologist.ui.btn 
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.describeType;
	import flash.utils.getQualifiedSuperclassName;
	import de.creativetechnologist.ui.btn.MCToggleButton;
	
	/**
	 * ...
	 * @author atul
	 * @version 0.1
	 */
	public class FrameClipToggleButton extends MCToggleButton
	{
		
		public function FrameClipToggleButton()
		{
			super(null, null);
			addEventListener(Event.ADDED, onAdded);
			
			for (var i:int = 0; i < numChildren; i++) 
			{
				var child : MovieClipButton = getChildAt(i) as MovieClipButton;
				if ( child ) _offButton = child 
			}
		}
		
		private function onAdded(e:Event):void 
		{
			var xml : XML = describeType(e.target);	
			if ( xml.extendsClass.(@type == "ywu.atul.button::AStandardButton").length() && e.target != this)
			{
				if ( currentLabel == "on")
				{
					_onButton = e.target as MovieClipButton;
				} else {
					_offButton = e.target as MovieClipButton;		
				}
			}
		}
		
		
		override protected function _setOnState():void 
		{
			gotoAndStop("on");
		}
		
		override protected function _setOffState():void 
		{
			gotoAndStop("off");
		}
		
	}
	
}