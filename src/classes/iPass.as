﻿/* iPass Class *//* Developed by InfiniteDrop Media */package classes{	import flash.display.Sprite;	import flash.text.TextField;	import flash.utils.Timer;	import flash.events.TimerEvent;	import flash.ui.Keyboard;	import flash.events.KeyboardEvent;	public class iPass extends Sprite	{		public static var pass:String = "";		public static var target:TextField;		private static var regExp:RegExp = /./g;		public static var timer:Timer = new Timer(1000);		public static function maskTextField(t:TextField):void		{			target = t;			addListeners();		}		private static function replaceOnTime(e:TimerEvent):void		{			target.text = target.text.replace(regExp, "•");			timer.stop();		}		private static function startTimer(e:KeyboardEvent):void		{			!timer.running ? timer.start() : timer.reset(); var msk:String = target.text.substring(0, target.length - 1); target.text = msk.replace(regExp, "•") + String.fromCharCode(e.charCode);timer.start();			for (var i:int = 65; i < 123; i++)			{				if (e.charCode == i)				{					pass += String.fromCharCode(i);				}			}			if (e.keyCode == Keyboard.BACKSPACE)			{				pass = pass.substring(0, pass.length - 1);			}		}				private static function addListeners():void		{			timer.addEventListener(TimerEvent.TIMER, replaceOnTime);			target.addEventListener(KeyboardEvent.KEY_UP, startTimer);		}	}}