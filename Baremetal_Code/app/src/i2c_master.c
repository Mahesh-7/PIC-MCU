#include<pic.h>

#include "../../app/inc/app.h"

void delay()
{
unsigned int i;
for(i=0;i<10000;i++);
}
void main()
{
	I2C_master_init();
	delay();

	I2C_start();delay();
	I2C_write_byte(0x26);delay();

	I2C_write_byte('a');delay();
	I2C_write_byte('b');delay();
	I2C_write_byte('c');delay();
	I2C_write_string("hello world");delay();
	I2C_stop();delay();

	while(1);	
	}