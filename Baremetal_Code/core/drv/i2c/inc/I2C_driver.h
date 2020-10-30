typedef unsigned char int8;

void I2C_master_init();

void I2C_slave_init();

void I2C_start();

void I2C_restart();

void I2C_stop();

void I2C_send_ACK();

void I2C_send_NACK();

int8 I2C_write_byte(int8 byte);

int8 I2C_read_byte();

void I2C_write_string(unsigned char *data);



