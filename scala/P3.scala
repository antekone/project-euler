// Project Euler #3 in Scala
// written by antekone
//
// http://anadoxin.org/blog

import scala.annotation.tailrec
import scala.collection.mutable.Queue

object P3 {
  def max(t: (Long,Long)): Long = if(t._1 > t._2) t._1 else t._2
  def min(t: (Long,Long)): Long = if(t._1 > t._2) t._2 else t._1

  @tailrec
  def fermatGen(n: Long, a: Long): (Long,Long) = {
    val f = a * a - n
    val b = math.sqrt(f).toLong

    if(b * b == f) {
      (a - b, a + b)
    } else {
      fermatGen(n, a + 1)
    }
  }

  def fermat(n: Long): (Long,Long) = {
    if(n % 2 == 0)
      (2, n / 2)
    else {
      fermatGen(n, math.sqrt(n).toLong)
    }
  }

  def explodeFactors(seq: Seq[Long], outseq: Queue[Long]): Unit = {
    seq.foreach(x => {
      val f = fermat(x)
      val isprime = min(f) == 1

      if(isprime) {
        outseq += max(f)
      } else {
        explodeFactors(Seq(f._1, f._2), outseq)
      }
    })
  }

  def biggestFactor(n: Long): Long = {
    val ft = fermat(n)
    val outseq = new Queue[Long]()

    explodeFactors(Seq(ft._1, ft._2), outseq)
    outseq.max
  }

  def main(args: Array[String]) {
    val biggestTestFactor = biggestFactor(600851475143L)
    println(biggestTestFactor)
  }
}
