#pragma once

class TA 
{
protected:
	int x, y;
public:
	TA();
	virtual void Data() = 0;
	~TA() {};
};

class TB : public TA
{
public:
	virtual void Data() override;
};

class TC : public TB
{
public:
	 virtual void Data() override;
};
