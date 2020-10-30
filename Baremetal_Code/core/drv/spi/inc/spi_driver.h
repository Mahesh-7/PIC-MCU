void dalay();
void spi_master_init();
void spi_slave_init();
void master_write(unsigned char data);
void master_write_string(const unsigned char * data);
unsigned char slave_read();
