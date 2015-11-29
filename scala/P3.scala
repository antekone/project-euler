// Project Euler #3 in Scala
// written by antekone
//
// http://anadoxin.org/blog

import scala.annotation.tailrec
import scala.collection.mutable.Queue

object P3 {
  // oneliners
  def max(t: (Long,Long)): Long =    if(t._1 > t._2) t._1 else t._2
  def min(t: (Long,Long)): Long =    if(t._1 > t._2) t._2 else t._1
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
  def explodeFactorsGen(arg: (Seq[Long], Seq[Long])): (Seq[Long], Seq[Long]) = {
    if(arg._1.isEmpty)
      return arg

    val result = arg._2
    val f = fermat(arg._1.head)

    if(min(f) == 1)
      // head is prime
      explodeFactorsGen((arg._1.tail, result :+ max(f)))
    else
      // head is not prime
      explodeFactorsGen((arg._1.tail :+ f._1 :+ f._2, result))
  }

  // normal functions
  def main(args: Array[String]) {
    println(biggestFactor(13195L))
    println(biggestFactor(600851475143L))
  }
}
