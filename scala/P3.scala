// Project Euler #3 in Scala
// written by antekone
//
// http://anadoxin.org/blog

import scala.annotation.tailrec

object P3 {
  // oneliners
  def max(t: (Long,Long)): Long = t match { case (f1, f2) => if(f1 > f2) f1 else f2 }
  def min(t: (Long,Long)): Long = t match { case (f1, f2) => if(f1 > f2) f2 else f1 }
  def fermat(n: Long): (Long,Long) = if(n % 2 == 0) (2, n / 2) else fermatGen(n, math.sqrt(n).toLong)
  def biggestFactor(n: Long): Long = explodeFactorsGen(Seq(n), Seq())._2.max

  // tail-recursive functions
  @tailrec
  def fermatGen(n: Long, a: Long): (Long,Long) = {
    val f = a * a - n
    val b = math.sqrt(f).toLong

    if(b * b == f)
      (a - b, a + b)
    else
      fermatGen(n, a + 1)
  }

  @tailrec
  def explodeFactorsGen(arg: (Seq[Long], Seq[Long])): (Seq[Long], Seq[Long]) = arg match {
    case (in, result) =>
      in match {
        case Nil => arg
        case x :: xs => {
          val f = fermat(x)
          if(min(f) == 1)
            // head is prime
            explodeFactorsGen((xs, result :+ max(f)))
          else
            // head is not prime
            f match {
              case (f1, f2) => explodeFactorsGen((xs :+ f1 :+ f2, result))
            }
        }
    }
  }

  // normal functions
  def main(args: Array[String]) {
    println(biggestFactor(13195L))
    println(biggestFactor(600851475143L))
  }
}
