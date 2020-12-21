#include <pic.h>
#define APP_H "../../app/inc/app.h"
#include APP_H 

void main()
{

    TRISB=0X00;
    PORTB=0X00;

    Timer0_Init();

	    while(1)
	    {
       
       
	        PORTB = ~PORTB;
	        Delay_sec_Timer0(1);//1 sec
	        //Delay_ms_Timer0(1000);//1 sec 
        
        }
}
