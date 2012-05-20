package de.creativetechnologist.ui.btn 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import de.creativetechnologist.ui.btn.event.MCToggleButtonEvent;
	
	/**
	 * ...
	 * @author atul
	 */
	
	[Event(name = "MCToggleButtonEvent.evt_toggle", type = "ywu.atul.button.event.MCToggleButtonEvent")]
	
	public class MCToggleButton extends MovieClipButton
	{
		public var _autoToggle:Boolean = true;
		
		protected var _onButton:MovieClipButton;
		protected var _offButton:MovieClipButton;
		
		private var _isOn:Boolean = false;
		
		public function MCToggleButton(onButton:MovieClipButton, offButton:MovieClipButton, idString:String = "")
		{
			super(idString);
			
			_onButton = onButton;
			_offButton = offButton;
			if ( _offButton != null ) this.addChild(_offButton);
		}
		
		
		public function set _on(value:Boolean):void
		{
			if (value != _isOn)
			{
				if (value)
				{
					_setOnState();
				} else {
					_setOffState();
				}
				_isOn = value;
			}
		}
		
		public function get _on():Boolean
		{
			return _isOn;
		}
		
		
		override protected function _onClick(e:MouseEvent):void 
		{
			if ( _autoToggle )
			{
				if (_isOn)
				{
					_on = false;
				} else {
					_on = true;
				}
			}
			dispatchEvent(new MCToggleButtonEvent(MCToggleButtonEvent.evt_toggle, _on, _idString));
			super._onClick(e);
		}
		
		
		override protected function _activateTransition():void 
		{
			if ( _onButton ) _onButton._activated = true;
			if ( _offButton ) _offButton._activated = true;
		}
		
		override protected function _deactivateTransition():void 
		{
			if ( _onButton ) _onButton._activated = false;
			if ( _offButton ) _offButton._activated = false;
		}
		
		override protected function _overTransition():void { }
		override protected function _outTransition():void  { };
		
		
		protected function _setOnState():void
		{
			if ( contains(_offButton) ) removeChild(_offButton);
			if ( !contains(_onButton) ) addChild(_onButton);
		}
		
		protected function _setOffState():void
		{
			if ( contains(_onButton) ) removeChild(_onButton);
			if ( !contains(_offButton) ) addChild(_offButton);
		}
		
	}
	
}