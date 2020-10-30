#include<pic.h>


unsigned char data[32],index=0,temp=0;

void delay()
{
	unsigned int delay=0;
	for(delay=0;delay<1000;delay++);

}

void spi_master_init()
{
	//master_init()
	TRISC=0X10;  
	SSPCON=0X20 ;//MASTER MODE
	SSPSTAT=0X00;
}

void spi_slave_init()
{
	//slave init
	TRISC=0X18;  //rc3(scl),rc4(sdi) input rc5(sdo) output
	SSPCON=0X25;//SLAVE MODE
	SSPSTAT=0X00;
}



void master_write(unsigned char data)
{

	SSPBUF=data;
	while(!SSPIF);
	SSPIF=0;
	

}

void master_write_string(const unsigned char * data)
{
		while(*data)
		{
			master_write(*data++); 
			delay();
		}
}


unsigned char slave_read()
{

  	while(!SSPIF);
	SSPIF=0;
	return SSPBUF;



}

