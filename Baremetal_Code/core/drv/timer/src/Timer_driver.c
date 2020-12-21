#include <pic.h>
#define APP_H "../../app/inc/app.h"
#include APP_H 

  
void Timer0_Init(void)
{
   
    OPTION=0x01;//counter
    TMR0=0X06;
    
}

void Delay_ms_Timer0(unsigned int Delay)
{
    //int a=Delay/1000;
    while( Delay>0)
    {
           
           while(T0IF==0);//WAITING UNTIL T0IF==1;
           TMR0=0X06;
           T0IF=0;
           Delay--;
    }
         
}

void Delay_sec_Timer0(unsigned int Delay)
{
    Delay *= 1000; 
    while(Delay>0)
    {
           
           while(T0IF==0);//WAITING UNTIL T0IF==1;
           TMR0=0X06;
           T0IF=0;
           Delay--;
    }
}

