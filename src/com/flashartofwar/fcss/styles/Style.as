
/**
 * <p>Original Author:  jessefreeman</p>
 *
 * <p>Class File: Style.as</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 *
 * <p>Revisions<br/>
 *		1.0  Initial version Aug 28, 2009</p>
 *
 */

package com.flashartofwar.fcss.styles
{
	import com.flashartofwar.fcss.objects.AbstractOrderedObject;

	import flash.net.registerClassAlias;

	/**
	 *
	 * @author jessefreeman
	 */
	public dynamic class Style extends AbstractOrderedObject
	{

		/**
		 *
		 * @default
		 */
		public static const DEFAULT_style_NAME:String = "Emptystyle";

		/**
		 *
		 * <p>Style is a special object that contains the names and values
		 * of properties another class can use to configure itself off of. Unlike
		 * a regular Object, the Style instance keeps an ordered list to
		 * allow ordered looping through it's values. This assures that the order
		 * of the values set will be correctly returned in the order expected.</p>
		 *
		 * @param properties
		 * @param propertiesIndex
		 *
		 */
		public function Style()
		{
			super(this);

			//
			styleName = DEFAULT_style_NAME;
			propertiesIndex.push("styleName");
		}

		/**
		 *
		 * @return
		 *
		 */
		public function clone():Style
		{
			var cloneProp:Style = new Style();
			var total:int = propertiesIndex.length;

			for (var i:int = 0; i < total; i++)
			{
				var prop:String = propertiesIndex[i];
				cloneProp[prop] = properties[prop];
			}

			return cloneProp;
		}


		/**
		 *
		 * @return
		 *
		 */
		public function get styleName():String
		{
			return properties.styleName;
		}

		/**
		 *
		 * @param value
		 *
		 */
		public function set styleName(value:String):void
		{
			properties.styleName = value;
		}

		/**
		 *
		 * @private
		 *
		 * @return
		 *
		 */
		override public function toString():String
		{
			return this["styleName"].concat(super.toString());
		}

		/**
		 *
		 *
		 */
		override protected function registerClass():void
		{
			registerClassAlias("com.flashartofwar.fcss.styles.Style", Style);
		}
	}
}

