#include <iostream>


extern "C" int sum_div9(int a);
extern "C" int divisible_5x3(int* array, int a);

int main() {
	int n = 20;
	int result = sum_div9(n);
	std::cout << "First result: " << result << '\n';

	int* array = new int[n];
	int b = 50;
	std::cout << "array: ";
	for (int i = 0; i < n; i++) {
		array[i] = rand() % b;
		std::cout << array[i] << " ";
	}
	std::cout << '\n';
	result = divisible_5x3(array, n);
	std::cout << "Second result: " << result;

	delete[] array;
	array = nullptr;
}