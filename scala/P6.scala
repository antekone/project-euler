object P6 {
  def main(args: Array[String]) = {
    val squareOfSum = math.pow(Range(1, 101).foldLeft(0)(_ + _), 2).toInt
    val sumOfSquares = Range(1, 101).map(x ⇒ x * x).foldLeft(0)(_ + _)

    println("Problem #6 result: %s".format(squareOfSum - sumOfSquares))
  }
}
