package ywu.atul.button.event 
{
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author atul
	 */
	public class MovieClipButtonEvent extends Event
	{
		protected var _sButtonId				: String;
		
		public static const evt_click			: String = "MovieClipButtonEvent.evt_click";
		
		
		
		public function MovieClipButtonEvent(type:String = null, buttonId : String = "", bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			this._sButtonId = buttonId;
			super(type, bubbles, cancelable);
		}
		
		
		public function get buttonId():String
		{
			return this._sButtonId;
		}
		
	}
	
}