package scuts1.instances.std;

import scuts1.core.In;
import scuts1.core.OfOf;
import scuts1.core.Of;
import scuts.ds.LazyList;

abstract LazyListTOf<M,A>(Of<M, LazyList<A>>) to Of<M, LazyList<A>> from Of<M, LazyList<A>> { 

	private function new (x) this = x;

	@:to function toOfOf():OfOf<M, LazyList<In>, A> return new Of(cast this);

	@:from static function fromOfOf(x:OfOf<M, LazyList<In>, A>):LazyListTOf<M,A> return new LazyListTOf(cast x);

}