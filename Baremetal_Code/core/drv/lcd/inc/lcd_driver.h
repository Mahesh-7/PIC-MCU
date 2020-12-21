#ifndef lcd
#define lcd

#define _XTAL_FREQ 4000000

void lcd_cmd(unsigned char cmd);

void lcd_char(unsigned char data);

void lcd_string(const char * ptr);

void lcd_init();

#endif

