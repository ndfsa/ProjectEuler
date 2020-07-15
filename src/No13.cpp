#include <iostream>
#include <string>

int main()
{
	std::string num{};
	double sum{};
	for (size_t i = 0; i < 100; i++)
	{
		std::cin >> num;
		sum += std::stold(num.substr(0, 10) + "." + num.substr(10));
		if (i == 90)
		{ 
			std::cout << "90";
		}
	}
	std::cout << std::to_string((long long)sum).substr(0, 10) << std::endl;
	return 0;
}
