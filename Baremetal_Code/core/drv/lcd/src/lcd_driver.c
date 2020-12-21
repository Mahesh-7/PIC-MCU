#include<pic.h>

#define APP_H "../../app/inc/app.h"
#include APP_H 

#define RS RE0
#define RW RE1
#define EN RE2


void lcd_cmd(unsigned char cmd)
{
		RS=0;
		PORTB=cmd;
		EN=1;
		__delay_ms(1);
		EN=0;
}

void lcd_char(unsigned char data)
{

		RS=1; //data for
		PORTB=data;
		EN=1;
		__delay_ms(1);
		EN=0;

}
void lcd_string(const char * ptr)
{
	while(*ptr)
	{
		lcd_char(*ptr);
		ptr++;
		
	}
}

void lcd_init()
{
			ADCON1=0x06;
			TRISB=0X00;
			PORTB=0X00;
			TRISE=0X00;
			PORTE=0X00;
			lcd_cmd(0x38);  //2nd row enable
			lcd_cmd(0x0c); //display
			lcd_cmd(0x80); //row
}

