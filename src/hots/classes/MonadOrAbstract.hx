package hots.classes;
import hots.classes.MonadZero;
import hots.Of;
import scuts.Scuts;




class MonadOrAbstract<M> implements MonadOr<M>
{
  var mz:MonadZero<M>;
  
  function new (monadZero:MonadZero<M>) {
    this.mz = monadZero;
  }
  
  public function orElse <A>(val1:Of<M,A>, val2:Of<M,A>):Of<M,A> return Scuts.abstractMethod()
  
  
  // delegation monad zero
  public inline function zero <A>():Of<M,A> return mz.zero()
  
  // delegation functor
  public inline function map<A,B>(f:A->B, val:Of<M,A>):Of<M,B> return mz.map(f, val)

  // delegation applicative
  public inline function ret<A>(x:A):Of<M,A> return mz.ret(x)
  
  public inline function apply<A,B>(f:Of<M,A->B>, val:Of<M,B>):Of<M,B> return mz.apply(f,val)
  
  public inline function thenRight<A,B>(val1:Of<M,A>, val2:Of<M,B>):Of<M,B> return mz.thenRight(val1,val2)
  
  public inline function thenLeft<A,B>(val1:Of<M,A>, val2:Of<M,B>):Of<M,A> return mz.thenLeft(val1, val2)

  // delegation monad
  public inline function flatMap<A,B>(val:Of<M,A>, f: A->Of<M,B>):Of<M,B> return mz.flatMap(val,f)
  
  public inline function flatten <A> (val: Of<M, Of<M,A>>):Of<M,A> return mz.flatten(val)
  
}