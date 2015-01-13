// project euler #1 in scala by antekone
// http://anadoxin.org/blog
//
// usage:
//
// $ scalac P1.scala
// $ scala P1

object P1 extends App {
    def nums(upTo: Int): List[Int] =
        for(i <- List.range(0, upTo) if i % 3 == 0 || i % 5 == 0)
            yield i

    println(nums(1000).foldLeft(0)(_ + _));
}
