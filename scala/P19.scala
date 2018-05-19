import java.text._
import java.util._

object P19 {
  def addDay(cal: Calendar, date: Date): Date = {
    cal.setTime(date)
    cal.add(Calendar.DAY_OF_YEAR, 1)
    return cal.getTime()
  }

  def main(args: Array[String]) {
    val df = new SimpleDateFormat("dd.MM.yyyy")
    val cal = Calendar.getInstance()
    val cal2 = Calendar.getInstance()

    lazy val days: Stream[Date] = {
      def recur(d: Date): Stream[Date] = d #:: recur(addDay(cal, d))
      recur(df.parse("01.01.1901"))
    }

    println(days.takeWhile(_.getTime() < df.parse("31.12.2000").getTime()).filter(d => {
      cal2.setTime(d)
      cal2.get(Calendar.DAY_OF_WEEK) == 1 && cal2.get(Calendar.DAY_OF_MONTH) == 1
    }).toList.size)
  }
}
