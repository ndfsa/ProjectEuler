object No3 {
  def main(args: Array[String]): Unit = {
    print(largestPrimeFactor(600851475143L))
  }

  def largestPrimeFactor(n: Long) = {
    def inner(n: Long, acc: Long): Long = {
      if ((n % acc == 0) && isPrime(acc))
        if (isPrime(n)) n
        else inner(n / acc, acc)
      else inner(n, acc + 1)
    }
    inner(n, 2)
  }

  def isPrime(n: Long): Boolean = {
    def inner(acc: Long): Boolean = {
      if (acc <= 1) true
      else if (n % acc == 0) false
      else inner(acc - 1)
    }
    val sqroot = Math.sqrt(n)
    if(sqroot.isWhole())false else inner(sqroot.toLong)
  }
}
