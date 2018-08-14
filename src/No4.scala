object No4 {

  def main(args: Array[String]): Unit = {
    print(lpdc(3))
  }

  def palindrome(num: Int): Boolean = {
    num == reverse(num)
  }

  def reverse(num: Int): Int = {
    def inner(acc1: Int, acc2: Int): Int = {
      if (acc1 == 0) acc2
      else inner(acc1 / 10, (acc2 * 10) + (acc1 % 10))
    }

    inner(num, 0)
  }

  def lpdc(digitCount: Int): Int = {
    val lower = math.pow(10, digitCount - 1)toInt
    val upper = (math.pow(10, digitCount)toInt) - 1

    def inner(acc1: List[Int], acc2: List[Int]): Int = {
      val iter = acc1.tail map (x => x * acc1.head) filter palindrome
      if (acc1.head == (lower+upper)/2) acc2 sortWith((x,y) => x>y) head
      else inner(acc1 tail, acc2 ::: iter)
    }
    inner(upper to lower by -1 toList, Nil)
  }
}
