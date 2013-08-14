class TestCast {
  
	// best case?
	@:extern static inline function as<T>(a:Dynamic, c:Class<T>):Null<T>  	       {
		return if (Std.is(a, c)) cast a; else null;
	}
	
	public function new() {
    var cit = new AITest();
    var ct = new ATest();
    var n = 100000;
    var time:Float;
    
    var it:ITest = null;
    var t:ATest = null;
    
	time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = as(cit, ITest);
    }
    trace(["best case to ITest  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = as(ct, ATest);
    }
    trace(["best case to ATest  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
	
	
	time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = as(ct, ITest);
    }
    trace(["best case to ITest  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = as(cit, ATest);
    }
    trace(["best case to ATest  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
	
	
	
	
	
    //////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = cast cit;
    }
    trace(["untyped cast to ITest  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = cast ct;
    }
    trace(["untyped cast to ATest  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
    
    //////
    it = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = cast(cit, ITest);
    }
    trace(["typed cast to ITest  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
  	t = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = cast(ct, ATest);
    }
    trace(["typed cast to ATest  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();


	//////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = if (Std.is(cit, ITest)) cast cit; else null;
    }
    trace(["untyped cast to ITest with Std.is  " ,haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = if (Std.is(ct, ATest)) cast ct; else null;
    }
    trace(["untyped cast to ATest with Std.is ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
    
    //////
    it = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = if (Std.is(cit, ITest)) cast(cit, ITest); else null;
    }
    trace(["typed cast to ITest with Std.is  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();
    
    //////
  	t = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = if (Std.is(ct, ATest)) cast(ct, ATest); else null;
    }
    trace(["typed cast to ATest with Std.is ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();


	//////
    it = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = if (Std.is(ct, ITest)) cast ct; else null;
    }
    trace(["wrong untyped cast to ITest with Std.is  ", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();

 	//////
  	t = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = if (Std.is(cit, ATest)) cast cit; else null;
    }
    trace(["wrong untyped cast to Test with Std.is  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();

	//////
    it = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = if (Std.is(ct, ITest)) cast(ct, ITest); else null;
    }
    trace(["wrong typed cast to ITest with Std.is", haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();

 	//////
  	t = null;
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = if (Std.is(cit, ATest)) cast(cit, ATest); else null;
    }
    trace(["wrong typed cast to ATest with Std.is  ", haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();

	#if !flash
	//////
    it = null;
    trace("wrong untyped cast to ITest"); // error in flash
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = cast ct;
    }
    trace([haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();

 	//////
  	t = null;
    trace("wrong untyped cast to ATest");  // error in flash
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = cast cit;
    }
    trace([haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
	#end
	
     
    /* errors for all targets
    //////
    it = null;
    trace("wrong typed cast to ITest");
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         it = cast(ct, ITest);
    }
    trace([haxe.Timer.stamp() - time, "  ", it]);
    time = haxe.Timer.stamp();

 	//////
  	t = null;
    trace("wrong typed cast to ATest"); 
    time = haxe.Timer.stamp();
    for (i in 0...n) {
         t = cast(cit, ATest);
    }
    trace([haxe.Timer.stamp() - time, "  ", t]);
    time = haxe.Timer.stamp();
	*/
  }
}

interface ITest {
  
}

class ATest {
  public function new() {}
}

class AITest implements ITest {
  public function new() {} 
}