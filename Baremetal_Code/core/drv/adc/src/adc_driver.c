#include <pic.h>

#define APP_H "../../app/inc/app.h"
#include APP_H 



unsigned short int adc_init(unsigned char channel)
{
    unsigned short int value=0;
    //unsigned short int timeout=0;
    
   if(channel<8)
   {
      ADCON1=0X82; //ALL CHANNEL ANOLOG in port A//RIGHT JUSTIFY
      ADCON0 =0b11000001|channel<<3; //FRC CLK//ADC ON//CHANNEL SELECT
      ADCON0|=1<<2;//ADC CONVERSION ON
      while((ADCON0&1<<2));   //after convertion it become zero
      value=(ADRESL)|(ADRESH<<8);      
   }
     return value;      
           
   }

unsigned short int adc_value(unsigned char channel)
{
   return  (adc_init(channel));
}

unsigned short int temp_value(unsigned char channel)
{
   return  ((adc_init(channel)/2.05)*100);
}




