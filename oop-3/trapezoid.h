#ifndef TRAPEZOID_H
#define TRAPEZOID_H

#include <iostream>
#include <cstdint>
#include "point.h"
#include "figure.h"

class Trapezoid : public Figure
{
public:
	Trapezoid();
	Trapezoid(Point a_, Point b_, Point c_, Point d_);
	Trapezoid(std::istream &is);
	Trapezoid(const Trapezoid& other);

	size_t VertexesNumber();
	double Area();
	void Print(std::ostream& os);

	virtual ~Trapezoid(); // деструктор 

private:
	Point a;
	Point b;
	Point c;
	Point d;
};

#endif /* TRAPEZOID_H */