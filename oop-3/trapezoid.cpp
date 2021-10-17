#include <iostream>
#include <cmath>
#include <cstdint>
#include "trapezoid.h"

Trapezoid::Trapezoid() :
a(Point()), b(Point()), c(Point()), d(Point()) {	
	std::cout << "Default constructor(Trapezoid)" << std::endl;
}

Trapezoid::Trapezoid(Point a_, Point b_, Point c_, Point d_) : 
a(a_), b(b_), c(c_), d(d_) {
	std::cout << "Constructor2(Trapezoid): " << a_ << " " << b_ << " " << c_ << " " << d_ << std::endl;
}

Trapezoid::Trapezoid(std::istream &is) // istream потоки ввода вывода
{
	is >> a;
	is >> b;
	is >> c;
	is >> d;
	std::cout << "Constructor(Trapezoid) via istream : " << a << " " << b << " " << c << " " << d << std::endl;
}

Trapezoid::Trapezoid(const Trapezoid& other)
	: Trapezoid(other.a, other.b, other.c, other.d) {
	std::cout << "Trapezoid copy created" << std::endl;
}

size_t Trapezoid::VertexesNumber() {
	return 4;
}

double Trapezoid::Area()
{
	double ax = a.X() - c.X();
	double bx = b.X() - d.X();
	double ay = a.Y() - c.Y();
	double by = b.Y() - d.Y();
	double COS = (ax * bx + ay * by) / (sqrt(ax * ax + ay * ay) * sqrt (bx * bx + by * by));
	return double(a.dist(c) * b.dist(d) * 0.5 * sin(acos(COS)));
}

void Trapezoid::Print(std::ostream& os)
{
	os << "a = " << a << ", " << "b = " << b << ", " << "c = " << c << ", " << "d = " << d;
}

Trapezoid::~Trapezoid()
{
	
}