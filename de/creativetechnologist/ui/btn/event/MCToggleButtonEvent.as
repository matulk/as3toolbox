package ywu.atul.button.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author atul
	 */
	public class MCToggleButtonEvent extends Event
	{
		protected var _sButtonId				: String;
		protected var _on						: Boolean;
		
		public static const evt_toggle			: String = "MCToggleButtonEvent.evt_toggle";
		
		
		
		public function MCToggleButtonEvent(type:String = null, on : Boolean = true, buttonId : String = "", bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			this._sButtonId = buttonId;
			this._on = on;
			super(type, bubbles, cancelable);
		}
		
		public function get on():Boolean
		{
			return _on;
		}
		
		public function get buttonId():String
		{
			return this._sButtonId;
		}
		
	}
	
}