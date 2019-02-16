object Main extends App {
  println(Range(2, 9999999).filter(n => n.toString.map(_.toInt - 0x30).map(math.pow(_, 5)).sum == n).sum)
}