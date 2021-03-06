package ;
#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end
/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class Measure
{
 
  /**
	 * Usage:
	 * Measure.run( "parse time ", b.parse(), c.parse() );
	 * or
	 * Measure.run( "parse time ", { b.parse(); c.parse() } );
	 * 
	 * -D measure - on/off measure
	 */
	macro static public function run(msg:String, exprs:Array<Expr>) {
		
		if (Context.defined("measure")) {
			exprs.unshift(macro var ____t____ = haxe.Timer.stamp());
			exprs.push(macro trace($v { msg } + (haxe.Timer.stamp() - ____t____)));
			return {expr:EBlock(exprs), pos:Context.currentPos()}
		}
		return if (exprs.length > 1)
			{expr:EBlock(exprs), pos:Context.currentPos()}
		else if (exprs.length == 1)
			exprs[0];
		else macro { };
	}
	
}