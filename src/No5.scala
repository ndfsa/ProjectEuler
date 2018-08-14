object No5 {
  def main(args: Array[String]): Unit = {
    print(smallestEvenlyDiv(20))
  }

  def smallestEvenlyDiv(n: Int): Int = {
    val l = 1 to n toList

    def inner(acc: Int): Int = {
      if (l.exists(x => acc % x > 0)) inner(acc + 1)
      else acc
    }

    inner(1)
  }
}
