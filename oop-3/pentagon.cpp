#include <iostream>
#include <cmath>
#include "pentagon.h"

double triangle(Point a, Point b, Point c) {
	double p = a.dist(b) + b.dist(c) + c.dist(a);
	double s = sqrt(p * (p - a.dist(b)) * (p - b.dist(c)) * (p - c.dist(a)));
	return s;
}

Pentagon::Pentagon() :
a(Point()), b(Point()), c(Point()), d(Point()), e(Point())
{
	std::cout << "Default constructor(Pentagon)" << std::endl;

}

Pentagon::Pentagon(Point a_, Point b_, Point c_, Point d_, Point e_): 
a(a_), b(b_), c(c_), d(d_), e(e_) {
	std::cout << "Constructor2(Pentagon): " << a_ << " " << b_ << " " << c_ << " " << d_ << " " << e_ << std::endl;
}

Pentagon::Pentagon(std::istream& is)
{
	is >> a;
	is >> b;
	is >> c;
	is >> d;
	is >> e;
	std::cout << "Constructor(Rhombus) via istream : " << a << " " << b << " " << c << " " << d << " " << e << std::endl;
}

Pentagon::Pentagon(const Pentagon& other) :
Pentagon(other.a, other.b, other.c, other.d, other.e) {
	std::cout << "Pentagon copy created" << std::endl;
}

size_t Pentagon::VertexesNumber() {
	return 5;
}

double Pentagon::Area()
{
	return triangle(a, b, c) + triangle(c, d, e) + triangle(d, e, a); 
}

void Pentagon::Print(std::ostream& os)
{
	os << "a = " << a << ", " << "b = " << b << ", " << "c = " << c << ", " << "d =  " << d << ", " << "e = " << e;
}

Pentagon::~Pentagon()
{
	
}