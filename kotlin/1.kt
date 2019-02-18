/**
 * project euler #1 in kotlin by antekone
 *
 * usage:
 * $ kotlinc 1.kt && kotlin -cp . _1Kt
 */

fun main(args: Array<String>) {
    println(IntRange(0, 999).filter {
        it % 3 == 0 || it % 5 == 0
    }.sum())
}
