object No2 {
  def main(args: Array[String]): Unit = {
    print(fibonacciEvenSum(4000000))
  }

  def fibonacciEvenSum(num: Int): Int = {
    def inner(acc: List[Int], a: Int, b: Int): List[Int] = {
      if (a + b > num) acc
      else inner(acc ::: List(a + b), b, a + b)
    }

    inner(List(1, 2), 1, 2).foldLeft(0)(
      (acc: Int, x: Int) => {
        if (x % 2 == 0) acc + x
        else acc
      })
  }
}
