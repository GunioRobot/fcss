package com.flashartofwar.fcss.behaviors
{
	import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;
	import com.flashartofwar.fcss.managers.StyleSheetManager;

	import flexunit.framework.Assert;

	public class ApplyStyleBehaviorTest
	{
		// Reference declaration for class to test
		private var classToTestRef : com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;

		private var dummyClassA:DummyClass;

		private var dummyClassB:DummyClass;

		public function get cssText():String
		{
			var xml:XML = <css><![CDATA[/* This is a comment in the CSS file */
								.DummyClass {
									name: DummyClass;
									x:50px;
									y:50px;
									visible:false;
								}

								#dummyClassB{
									y:100;
									visible: true;
								}

								#testStyle
								{
									name: testStyle;
									x: 350px;
								}
							]]>
				</css>;
			return xml.toString();
		}

		[Before(ui)]
		public function runBeforeEachTest():void
		{
			StyleSheetManager.instance.parseCSS(cssText);

			dummyClassA = new DummyClass();
			dummyClassB = new DummyClass("dummyClassB");
		}

		[After(ui)]
		public function runAfterEachTest():void
		{
			dummyClassA = null;
			dummyClassB = null;
		}

		public function ApplyStyleBehaviorTest()
		{
		}

		[Test]
		public function testApplyDefaultStyle():void
		{
			Assert.assertEquals(dummyClassA.name, "DummyClass");
		}

		[Test]
		public function testApplyStyle():void
		{
			dummyClassA.applyStyle(StyleSheetManager.instance.getStyle("#testStyle"));
			Assert.assertEquals(dummyClassA.x, 350);
		}

		[Test]
		public function testGet_className():void
		{
			// Add your test logic here
			Assert.assertEquals(dummyClassA.className, "DummyClass");
		}

		[Test]
		public function testGet_id():void
		{
			// Add your test logic here
			Assert.assertEquals(dummyClassB.id, "dummyClassB");
		}
	}
}

import com.flashartofwar.fcss.behaviors.ApplyStyleBehavior;
import com.flashartofwar.fcss.styles.Style;

import flash.display.Sprite;

class DummyClass extends Sprite
{

	private var styleBehavior:ApplyStyleBehavior;

	public function DummyClass(id:String = "dummyClass")
	{
		createStyleBehavior(id);
	}

	public function applyStyle(style:Style):void
	{
		styleBehavior.applyStyle(style);
	}

	public function get className():String
	{
		return styleBehavior.className;
	}

	public function get id():String
	{
		return styleBehavior.id;
	}

	private function createStyleBehavior(id:String):void
	{
		styleBehavior = new ApplyStyleBehavior(id, this);
	}
}