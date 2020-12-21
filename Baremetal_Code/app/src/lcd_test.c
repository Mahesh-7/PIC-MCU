#include <pic.h>

#define APP_H "../../app/inc/app.h"
#include APP_H 




void main()
{
	lcd_init();
	lcd_string("hello world");
    lcd_cmd(0xc0);
	lcd_char('d');

	while(1)
	{

	}

}