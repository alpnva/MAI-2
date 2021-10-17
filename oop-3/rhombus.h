#ifndef RHOMBUS_H
#define RHOMBUS_H

#include <iostream>
#include <cstdint>
#include "figure.h"
#include "point.h"

class Rhombus : public Figure 
{
public:
	Rhombus();
	Rhombus(Point a_, Point b_, Point c_, Point d_);
	Rhombus(std::istream &is);
	Rhombus(const Rhombus& other);

	size_t VertexesNumber();
	double Area();
	void Print(std::ostream& os);
	
	virtual ~Rhombus();

private:
	Point a;
	Point b;
	Point c;
	Point d;
};

#endif /* RHOMBUS_H */