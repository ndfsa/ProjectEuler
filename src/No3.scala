object No3 {
  def main(args: Array[String]): Unit = {
    print(largestPrimeFactor(600851475143L))
  }

  def largestPrimeFactor(n: Long) = {
    def inner(acc: Long): Long = {
      if (isPrime(acc) && (n % acc == 0)) acc else inner(acc - 1)
    }

    inner(n - 1)
  }

  def isPrime(n: Long): Boolean = {
    def inner(acc: Long): Boolean = {
      if (acc <= 1) true
      else if (n % acc == 0) false
      else inner(acc - 1)
    }

    inner(n - 1)
  }
}
