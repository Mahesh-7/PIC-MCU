#include<pic.h>
#include "..\..\app\inc\app.h"

void delay1()
{
    unsigned int i;
    for( i=0;i<10000;i++);
}

void main() 
{
   
    uart_init();
	delay(); 


	uart_write('a');
	delay1();  
	uart_write('b');
	delay1();
	uart_write('c');
	delay1();  
	uart_write('d');
	delay1(); 
	uart_string("hello world");
	delay1(); 

	while(1)
	{

	}
    

    
}    

    
