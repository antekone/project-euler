object P20 {
  def main(args: Array[String]) {
    val result = Range(1, 100).foldLeft[BigInt](1)(_ * _).toString.map((x) => (x - 0x30)).foldLeft[Int](0)(_ + _);
    println(result);
  }
}
