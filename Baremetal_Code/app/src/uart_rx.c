#include <pic.h>
#include "..\..\app\inc\app.h"

unsigned char temp[32],index=0;

void delay1(void)
{
        unsigned int i,j;      
        for (j=0; j<1000; j++);
}



void main()
{
   uart_init();
   lcd_init();       
   delay1();

   while(1)
	{
		temp[index]=uart_read();   
		lcd_char(temp[index]);
		index++;
	
	}
 
}
