package de.creativetechnologist.ui.btn
{
	import flash.display.MovieClip;
	import de.creativetechnologist.ui.btn.MovieClipButton;
	
	/**
	 * ...
	 * @author atul
	 * @version 0.1
	 */
		
	public class FrameClipButton extends MovieClipButton
	{
		
		public function FrameClipButton(idString:String = "") 
		{
			super(idString);
		}
		
		override protected function _activateTransition():void
		{
			this.gotoAndStop("active");
		}
		
		override protected function _deactivateTransition():void
		{
			this.gotoAndStop("deactive");
		}
		
		override protected function _overTransition():void 
		{
			this.gotoAndStop("over");
		}
		
		override protected function _outTransition():void 
		{
			this.gotoAndStop("out");
		}
		
	}
	
}