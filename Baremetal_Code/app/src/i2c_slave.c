#include<pic.h>

#include "../../app/inc/app.h"


void delay()
{
	unsigned int i;
	for(i=0;i<1000;i++);
}
void main()
{
	unsigned char temp=0;

	I2C_slave_init();

	lcd_init();

	delay();


	while(1)
	{

		temp=(unsigned char)I2C_read_byte();
		delay();
		lcd_char(temp);
	
	}


}