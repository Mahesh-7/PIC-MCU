#include <pic.h>

//unsigned char temp[32],index=0;

void delay(void)
{
        unsigned int i,j;      
        for (j=0; j<1000; j++);
}

void uart_init()
{
    TRISC=0X80;
    TXSTA=0X26;
    RCSTA=0X90;//CREN=1;
    SPBRG=25;

}


void uart_write(unsigned char data)
{
       // while(!TRMT);   //1 empty, 0 full
		if(TRMT ==1 && SPEN==1  &&TXEN==1) //must tx buffer empty and serial port enable && tranmit enable
		{
			TXREG=data;
		}
        

}

void uart_string(unsigned char *data)
{
    while(*data)
    {
        uart_write(*data++);
        delay();
    }
}

unsigned char uart_read()
{

   		while(!RCIF); 
        RCIF=0;
		//delay();      
		return RCREG;

}
