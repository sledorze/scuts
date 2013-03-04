package scuts1.syntax;
import scuts1.classes.Show;


class ShowBuilder
{
  
  @:noUsing public static function create<T>(f:T->String) return new ShowByFun(f);
}

private class ShowByFun<T> implements Show<T>
{
  
  var f : T->String;
  
  public function new (f:T->String) this.f = f;
  
  public inline function show (s:T) return f(s);
  
}