#include <cstdlib>
#include <cstring>
#include <iostream>
#include "trapezoid.h"
#include "rhombus.h"
#include "pentagon.h"

int main() {
	const int size = 16;
	char s[size];
	std::cout << "Use 'help' or 'h' to get help." << std::endl;
	/*Trapezoid *ptr_tr = nullptr; // ключевое слово, для описания константы нулевого указателя
	Rhombus *ptr_rh = nullptr;
	Pentagon *ptr_pen = nullptr;*/
	while(1) {  // цикл бесконечный, while(true)
		std::cin.getline(s, size); // чтение строки или строки из входного потока(часть заголовка string)
		std::cin.clear(); // используем, чтобы избавиться от флага ошибки, сброс битов ошибок входного стандартного потока
		std::cin.sync(); // очищение буфера стандартного ввода
		if (!strcmp(s, "create_trapezoid") || !strcmp(s, "cr_tr")) {
			std::cout << "Enter trapezoid coordinates." << std::endl;
			Trapezoid a(std::cin);
			a.Print(std::cout);
			std::cout << '\n' << std::endl;
			std::cout << "Vertex Number = " << a.VertexesNumber() << '\n' << std::endl;
			std::cout << "Sqare = " << a.Area() << std::endl;
			//delete a.Trapezoid;
		} else if (!strcmp(s, "create_rhombus") || !strcmp(s, "cr_rh")) {
			std::cout << "Enter rhombus coordinates." << std::endl;
			Rhombus b(std::cin);
			b.Print(std::cout);
			std::cout << '\n' << std::endl;
			std::cout << "Vertex Number = " << b.VertexesNumber() << '\n' << std::endl;
			std::cout << "Square = " << b.Area() << std::endl;
		} else if (!strcmp(s, "create_pentagon") || !strcmp(s, "cr_pen")) {
			std::cout << "Enter pentagon coordinates" << std::endl;
			Pentagon c(std::cin);
			c.Print(std::cout);
			std::cout << '\n' << std::endl;
			std::cout << "Vertex Number = " << c.VertexesNumber() << '\n' <<std::endl;
			std::cout << "Square = " << c.Area() << std::endl;
		} else if (!strcmp(s,  "quit") || !strcmp(s, "exit") || !strcmp(s, "q")) {
			break;
		} else if (!strcmp(s, "help") || !strcmp(s, "h")) {
			std::cout << "Commands 'create_trapezoid' and 'cr_tr' create new trapeze with your parameters." << std::endl;
            std::cout << "Commands 'create_rhombus' and 'cr_rh' create new rhomb with your parameters." << std::endl;
            std::cout << "Commands 'create_pentagon' and 'cr_pen' create new pentagon with your parameters." << std::endl;
            std::cout << "Commands 'quit' and 'q' exit the program." << std::endl;
		}

	}
	return 0;
}