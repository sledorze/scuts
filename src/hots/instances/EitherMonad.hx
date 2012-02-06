package hots.instances;

import hots.classes.Monad;
import hots.classes.MonadAbstract;
import hots.In;
import scuts.core.types.Either;

#if (macro || display)
import hots.macros.TypeClasses;
import haxe.macro.Expr;
#end

class EitherMonad 
{
  static var instance:EitherMonadImpl<Dynamic>;
  
  static function get <T>():EitherMonadImpl<T>
  {
    if (instance == null) instance = new EitherMonadImpl();
    return cast instance;
  }
}

typedef B = EitherBox;

class EitherMonadImpl<L> extends MonadAbstract<Either<L,In>> {
  
  public function new () {
    super(EitherApplicative.get());
    
  }
  
  override public function flatMap<A,B>(val:EitherOf<L,A>, f: A->EitherOf<L,B>):EitherOf<L,B> {
    var o = B.unbox(val);
    
    return switch(o) {
      case Left(v): B.box(Left(v));
      case Right(v): f(v);
    };
  }
}