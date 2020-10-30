#include<pic.h>

#define _XTAL_FREQ 4000000
#define SDA RC4
#define SCL RC3
typedef unsigned char int8;

void delay1()
{
	unsigned int i;
	for(i=0;i<10000;i++);
}

void I2C_master_init()
{
	TRISC=0X18;
	SSPADD=9;  //clk generator
	SSPSTAT=0X80;
	SSPCON=0X38; //MASTER MODE
} 

void I2C_slave_init()
{
	TRISC=0X18;
	SSPADD=0X26;  //SLAVE MODE ADDRESS
	SSPSTAT=0X80;
	SSPCON=0X36; //SLAVE MODE
} 

void I2C_start()
{
	SEN=1;
	while(!SSPIF);
	SSPIF=0;
}

void I2C_restart()
{
	RSEN=1;
	while(!SSPIF);
	SSPIF=0;
}

void I2C_stop()
{
	PEN=1;
	while(!SSPIF);
	SSPIF=0;
}

void I2C_send_ACK()
{
	ACKDT=0;
	ACKEN=1;
	while(!SSPIF);
	SSPIF=0;
}

void I2C_send_NACK()
{
	ACKDT=1;
	ACKEN=1;
	while(!SSPIF);
	SSPIF=0;
}

int8 I2C_write_byte(int8 byte)
{
	SSPBUF=byte;
	while(!SSPIF);
	SSPIF=0;
	return ACKSTAT;
}

int8 I2C_read_byte()
{

	RCEN=1;
	while(!SSPIF);
	SSPIF=0;
	return SSPBUF;

}

void I2C_write_string(unsigned char *data)
{
	while(*data)
	{
		I2C_write_byte(*data++);
		delay1();
	}
}