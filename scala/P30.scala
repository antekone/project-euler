import scala.collection.mutable

class Main {
  def p30(): Unit = {
    var n = 2
    var expr = true
    var mem = new mutable.MutableList[Int]

    while(expr) {
      val powSum = n.toString().map(_.toInt - 0x30).map(n => n*n*n*n*n).sum
      if(powSum == n) {
        mem += n
      }

      n += 1
      if(n > 9999999) {
        expr = false
      }
    }

    println(mem.sum)
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    new Main().p30()
  }
}