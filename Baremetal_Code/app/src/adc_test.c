#include<pic.h>

#define APP_H "../../app/inc/app.h"
#include APP_H 


static void display(unsigned short int value,unsigned char location);
static void display1(unsigned short int value,unsigned char location);

void delay()
{
    unsigned int i,j;
   // for(j=0;j<250;j++)
    for(i=0;i<255;i++);
}

void main()
{

    lcd_init();

    lcd_cmd(0X80);

    unsigned char a[]="pot val:";

    lcd_string(a);

    lcd_cmd(0xc0);

    lcd_string("temp val:");
  
        
   while(1)    
    {
    	
     display(adc_value(0),0x8a);

     display1(temp_value(1),0xca); 
      
  
    }
    
}


static void display(unsigned short int value,unsigned char location)
{
    lcd_cmd(location);
    lcd_char((value/1000)+0x30);
    lcd_char(((value%1000)/100)+0x30);
    lcd_char(((value%100)/10)+0x30);
    lcd_char((value%10)+0x30); 

}



static void display1(unsigned short int value,unsigned char location)
{
    lcd_cmd(location);
    lcd_char((value/1000)+0x30);
    lcd_char(((value%1000)/100)+0x30);
	lcd_char('.');
    lcd_char(((value%100)/10)+0x30);
    lcd_char((value%10)+0x30); 
    lcd_char('c');
}

