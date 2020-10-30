 
#ifndef __UART_H__//HEADER GUARD
#define	__UART_H__
#include <pic.h>

void uart_init(void);
void uart_write(unsigned char data);
void uart_string(unsigned char *data);
//unsigned char temp[30],index=0;
unsigned char uart_read();

#endif	/* __UART_H__ */

