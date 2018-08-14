object No6 {
  def main(args: Array[String]): Unit = {
    print(squareSumDifference(100))
  }

  def squareSumDifference(n: Int) = squaredSum(n) - sumOfSquares(n)

  def squaredSum(n: Int): Int = {
    n * n * (n + 1) * (n + 1) / 4
  }

  def sumOfSquares(n: Int) = {
    (n * (n + 1) * ((2 * n) + 1)) / 6
  }

}
