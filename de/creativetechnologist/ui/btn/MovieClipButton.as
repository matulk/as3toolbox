package de.creativetechnologist.ui.btn 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import de.creativetechnologist.ui.btn.event.MovieClipButtonEvent;
		
	/**
	 * ...
	 * @author atul
	 * @version 0.3
	 */
	
	[Event(name="MovieClipButtonEvent.evt_click", type = "ywu.atul.button.event.MovieClipButtonEvent")]
	
	public class MovieClipButton extends MovieClip
	{
		protected var _sIdString			: String;
		protected var _isActivated			: Boolean = true;
		protected var _isHidden				: Boolean = false;
		protected var _spHit				: Sprite;
		
		
		public function MovieClipButton(idString : String = "", isHidden:Boolean = false ) 
		{
			this._sIdString = idString;
			_isHidden = isHidden;
			visible = !isHidden;
			this._makeListeners();
			this.buttonMode = true;
		}
		
		public function get _idString():String
		{
			return this._sIdString;
		}
		
		public function set _idString(value:String):void
		{
			this._idString = value;
		}
		
		
		
		public function _createHitZone():void
		{
			if ( _spHit == null)
			{
				_spHit = new Sprite();
				_spHit.alpha = 0;
			} else {
				_spHit.graphics.clear();
			}
			
			_spHit.graphics.beginFill(0xff00ff);
			var bounds : Rectangle = getBounds(this);
			_spHit.graphics.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);
			_spHit.graphics.endFill();
			
			if ( !contains(_spHit) ) addChild(_spHit);
		}
		
		public function get _hit():Sprite { return _spHit }
		
		
		public function set _activated ( value : Boolean ): void
		{
			if ( value != this._isActivated )
			{
				this._isActivated = value;
				if ( value )
				{
					this._makeListeners();
					this.buttonMode = true;
					this._activateTransition();
				} else {
					this._destroyListeners();
					this.buttonMode = false;
					this._deactivateTransition();
				}
			}
		}
		
		
		public function get _activated():Boolean
		{
			return _isActivated;
		}
				
		
		public function set _hidden ( value : Boolean ) :void
		{
			if ( value != this._isHidden )
			{
				this._isHidden = value;
				if ( value )
				{
					this._destroyListeners();
					this._hideTransition();
				} else {
					if ( this._isActivated ) this._makeListeners();
					this._unhideTransition();
				}
			}
		}
		
		
		public function _hideFast():void
		{
			alpha = 0;
			visible = false;
			_isHidden = true;
			_destroyListeners();
		}
		
		
		public function _unhideFast():void
		{
			alpha = 1;
			visible = true;
			_isHidden = false;
			if ( this._isActivated ) this._makeListeners();
		}
		
		
		public function get _hidden():Boolean
		{
			return this._isHidden;
		}
		
		
		protected function _makeListeners():void
		{
			this.addEventListener(MouseEvent.CLICK, _onClick);
			this.addEventListener(MouseEvent.MOUSE_OVER, _onOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, _onOut);
		}
		
		
		protected function _destroyListeners():void
		{
			this.removeEventListener(MouseEvent.CLICK, _onClick);
			this.removeEventListener(MouseEvent.MOUSE_OVER, _onOver);
			this.removeEventListener(MouseEvent.MOUSE_OUT, _onOut);
		}
		
		
		protected function _activateTransition():void
		{
			if ( !_hidden)
			{
				this.visible = true;
				this.alpha = 1;
			}
		}
		
		protected function _deactivateTransition():void
		{
			if ( !_hidden)
			{
				this.visible = true;
				this.alpha = .5;
			}
		}
		
		protected function _hideTransition():void
		{
			this.visible = false;
		}
		
		protected function _unhideTransition():void
		{
			this.visible = true;
			if ( _isActivated)
				this.alpha = 1;
			else
				this.alpha = .5;
		}		
		
		
		
		protected function _overTransition():void
		{
			
		}
		
		protected function _outTransition():void
		{
			
		}
		
		
		protected function _onClick(e:MouseEvent):void
		{
			this.dispatchEvent(new MovieClipButtonEvent(MovieClipButtonEvent.evt_click, this._idString));
		}
		
		
		protected function _onOver(e:MouseEvent):void
		{
			if ( this._isActivated && !this._isHidden)
			{
				this._overTransition();
			}
		}
		
		protected function _onOut(e:MouseEvent):void
		{
			if ( this._isActivated && !this._isHidden)
			{
				this._outTransition();
			}
		}
		
	}
	
}