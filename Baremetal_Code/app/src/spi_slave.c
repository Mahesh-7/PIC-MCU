#include<pic.h>
#define _XTAL_FREQ 4000000

#include "../../app/inc/app.h"

unsigned char temp=0;

void main()
{
	

	spi_slave_init();
	
	__delay_ms(500);

	lcd_init();

	while(1)
	{
		temp=slave_read();

		lcd_char(temp);	
	}
	

	
	}