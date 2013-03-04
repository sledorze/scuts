package scuts1.instances.std;
import scuts1.classes.Functor;
import scuts1.core.In;
import scuts1.core.Of;
import scuts1.instances.std.LazyTOf;
import scuts.core.Lazy;

class LazyTFunctor<M> implements Functor<Of<M, Void->In>>
{
  var functorT:Functor<M>;
  
  public function new(f:Functor<M>) 
  {
    this.functorT = f;
  }
  
  public function map <A,B>(x:LazyTOf<M, A>, f:A->B):LazyTOf<M,B>
  {

    function lazyMap <A,B>(x1:Lazy<A>, f:A->B):Lazy<B> return function () return f(x1());
    
    return functorT.map(x, lazyMap.bind(_,f));
    
    //return r;
  }
  
}