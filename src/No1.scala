object No1 {
  def main(args: Array[String]): Unit = {
    print(multipleSum(1000))
  }

  def multipleSum(n: Int): Int = {
    ((1 to n - 1).toList).foldLeft(0)((acc, x) => {
      if ((x % 3 == 0) || (x % 5 == 0)) x + acc
      else acc
    })
  }
}
