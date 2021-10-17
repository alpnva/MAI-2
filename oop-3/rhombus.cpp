#include <iostream>
#include <cmath>
#include "rhombus.h"

#define PI 3.14159265

Rhombus::Rhombus() : 
a(Point()), b(Point()), c(Point()), d(Point())
{
	std::cout << "Default constructor(Rhombus)" << std::endl;
}

Rhombus::Rhombus(Point a_, Point b_, Point c_, Point d_):
a(a_), b(b_), c(c_), d(d_) {
	std::cout << "Constructor2(Rhombus): " << a_ << " " << b_ << " " << c_ << " " << d_ << std::endl;
}

Rhombus::Rhombus(std::istream &is)
{
	is >> a;
	is >> b;
	is >> c;
	is >> d;
	std::cout << "Constructor(Rhombus) via istream : " << a << " " << b << " " << c << " " << d << std::endl;
}

Rhombus::Rhombus(const Rhombus& other) :
Rhombus(other.a, other.b, other.c, other.d) {
	std::cout << "Rhombus copy created" << std::endl;
}

size_t Rhombus::VertexesNumber() {
	return 4;
}

double Rhombus::Area() 
{
	return a.dist(c) * b.dist(d) * 0.5;
}

void Rhombus::Print(std::ostream& os)
{
	os << "a = " << a << ", " << "b = " << b << ", " << "c = " << c << ", " << "d = " << d;
}

Rhombus::~Rhombus()
{
	
}