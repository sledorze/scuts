package hots.instances;
import hots.Of;

/**
 * ...
 * @author 
 */

class KleisliBox 
{

  public static inline function box <M,A,B>(m:A->Of<M,B>):KleisliOf<M,A,B> return cast m
  public static inline function unbox <M,A,B>(m:KleisliOf<M,A,B>):A->Of<M, B> return cast m
  
}