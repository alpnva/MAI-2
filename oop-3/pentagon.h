#ifndef PENTAGON_H
#define PENTAGON_H

#include <iostream>
#include <cstdint>
#include "point.h"
#include "figure.h"

class Pentagon:public Figure 
{
public:
	Pentagon();
	Pentagon(Point a_, Point b_, Point c_, Point d_, Point e_);
	Pentagon(std::istream &is);
	Pentagon(const Pentagon& other);

	size_t VertexesNumber();
	double Area();
	void Print(std::ostream& os);
	virtual ~Pentagon();

private:
	Point a;
	Point b;
	Point c;
	Point d;
	Point e;
};

#endif /* PENTAGON_H */