#ifndef FIGURE_H
#define FIGURE_H

class Figure 
{
public:
	virtual size_t VertexesNumber() = 0;
	virtual double Area() = 0;
	virtual void Print(std::ostream& os) = 0;

	virtual ~Figure() {};
};

#endif /* FIGURE_H */
