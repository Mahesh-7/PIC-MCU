#ifndef main_h     //header guards
#define main_h
#define _XTAL_FREQ 4000000


#define ON									1
#define OFF									0

#define ENABLE								ON
#define DISABLE								OFF	

#define SET									ENABLE
#define CLEAR								DISABLE

#define SET_INPUT(reg,data)					reg=data
#define SET_OUTPUT(reg,data)				reg=data

#define SET_ON(reg,data)					reg=data
#define SET_OFF(reg,data)					reg=data

#define SET_PIN(reg,pin)					reg |= (1<<pin)
#define	CLEAR_PIN(reg,pin)					reg &= ~(1<<pin)
#define	TOGGLE_PIN(reg,pin)					reg ^= (1<<pin)
#define WRITE_PIN(reg,pin)					SET_PIN(reg,pin)
#define READ_PIN(port,pin)					(port&(1<<pin))


void delay(void);


#endif