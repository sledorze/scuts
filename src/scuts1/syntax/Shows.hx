package scuts1.syntax;
import scuts1.classes.Show;


class Shows
{
  public static inline function show<T>(v1:T, s:Show<T>):String return s.show(v1);
  
}
