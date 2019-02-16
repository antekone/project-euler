import scala.collection.mutable

object P32 {
  def main(args: Array[String]): Unit = {
    var mem = new mutable.MutableList[Int]

    for(x <- 1 to 1000) {
      for(y <- 1 to 9999) {
        val prod = x * y

        val str = (x.toString + y.toString + prod.toString)
          .chars
          .sorted
          .toArray
          .foldLeft(new StringBuilder)((a, b) => a.append(b - 0x30)).toString()

        if(str.length == 9 && str.equals("123456789") && !mem.contains(prod)) {
          mem += prod
        }
      }
    }

    println(mem.sum)
  }
}
