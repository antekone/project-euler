object Main {
  def primeTest(n: Int): Boolean = {
    if(n < 0)
      return false;

    for(i <- 2 to Math.sqrt(n).floor.toInt) {
      if(n % i == 0)
        return false
    }

    true
  }

  def primeCount(a: Int, b: Int, nMax: Int): Int = {
    var cnt = 0
    for(n <- 0 to nMax) {
      val num = n * n + a * n + b;
      if(primeTest(num)) {
        cnt += 1
      } else
        return cnt
    }

    return cnt
  }

  def main(args: Array[String]): Unit = {
    var pcMax = 0
    var params: (Int, Int) = null

    for(a <- -1000 to 1000) {
      for(b <- -1000 to 1000) {
        val pc = primeCount(a, b, 1000)
        if(pc > 10) {
          if(pc > pcMax) {
            pcMax = pc
            params = (a, b)
          }
        }
      }
    }

    println(f"${params._1 * params._2}")
  }
}
