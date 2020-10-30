#include<pic.h>
#define _XTAL_FREQ 4000000

#include "../../app/inc/app.h"

void main()

{

	spi_master_init();

	__delay_ms(500);
	
	master_write('0');__delay_ms(200);  //0x30   /// 0011 0000   //1mhz
	master_write('1');__delay_ms(200);
	master_write('2');__delay_ms(200);
	master_write('3');__delay_ms(200);

	master_write_string("hello world");

	while(1);
}


