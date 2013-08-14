package ;

/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class TestCallback
{

	public var f:Void -> Void;
	
	public function a() { }
	
	public function new() 
	{
		var b = function () { };
		
		var n = 10000000;
		f = a;
		Measure.run("a  ", for (i in 0...n) f());
		
		f = b;
		Measure.run("b  ", for (i in 0...n) f());
	}
	
}