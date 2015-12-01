object P14 {
  def countCollatzSequenceSize(seq: Stream[Long]): Long =
    1 + seq.takeWhile(_ != 1).length

  def getCollatzSequence(n: Long): Stream[Long] = {
    lazy val coll: Stream[Long] = {
      def recur(n: Long): Stream[Long] = n #:: recur(if(n % 2 == 0) n/2 else 3*n+1)
      recur(n)
    }

    coll
  }

  def main(args: Array[String]) = {
    Range(1, 999999).par.map(idx => (countCollatzSequenceSize(getCollatzSequence(idx)), idx)).max match {
      case (idx,value) => println("Solution to #14 is: %d".format(value))
    }
  }
}
