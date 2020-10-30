#include <pic.h>
#define APP_H "../../app/inc/app.h"
#include APP_H 


void delay()
{
	unsigned int delay;
	for(delay=0;delay<1000;delay++);
}

void main()
{

	SET_OUTPUT(TRISB,0X00);  //all output
	SET_OFF(PORTB,0X00);  //all reset
	WRITE_PIN(TRISC,0); //RC0 pin switch

	while(1)
	{
		while(!READ_PIN(PORTC,0));
		SET_ON(PORTB,0Xff);  //all toggle
		while(READ_PIN(PORTC,0));
		SET_OFF(PORTB,0X00);
	//	delay();
	
	}

}

