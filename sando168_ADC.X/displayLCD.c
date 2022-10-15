/*
 * Keypad Library
 *
 * By: Rigo Sandoval
 * email: sando168@umn.edu
 * date: Mar. 29, 2021
 *
 */

#include "xc.h"
#include "displayLCD.h"
#include <string.h>

/* This library is only compatible for use with a PIC24FJ64GA004 Family
 * micro controllers and the SITRONIX LCD controller/driver
 * 
 * The only other library needed is the "xc.h" library for compilation
 * with the XC16 compiler
 * 
 * This library makes it easy to use the LCD display by
 * providing functions that take care of the i2c communication.
 * All you need to do is provide the necessary arguments for your
 * desired outcome.
 * 
 * This library includes functions that do the following:
 *  - initialize the lcd display
 *  - send commands to the lcd display chips using i2c
 *  - set the cursor position on the lcd display
 *  - allow you to animate the display to move left or right
 *  - print an ASCII compatible character to the display
 *  - print a string to the lcd display
 */


void delay_ms(unsigned int ms)
{
    while(ms-- > 0){
        asm("repeat #15998");
        asm("nop");
    }
}

// initializes LCD Display to 8-bit and 2 lines
void lcd_init()
{
    I2C2BRG = 0x9D;           // set clock frequency to 100 kHz
    IFS3bits.MI2C2IF = 0;   // clear Interrupt Flag
    I2C2CONbits.I2CEN = 1;  // enable I2C mode
    
    delay_ms(40);
    
    lcd_cmd(0b00111000);    // function set
    lcd_cmd(0b00111001);    // function set, advance instruction mode
    lcd_cmd(0b00010100);    // interval osc frequency
    lcd_cmd(0b01110000);    // contrast Low
    lcd_cmd(0b01011110);
    lcd_cmd(0b01101100);    // follower control
    
    delay_ms(200);
    
    lcd_cmd(0b00111000);    // function set
    lcd_cmd(0b00001100);    // display on
    lcd_cmd(0b00000001);
    lcd_cmd(0b00000001);    // clear display
    
    delay_ms(2);
    
}
// uses i2c to send commands to the lcd chip setting the control bit to zero
void lcd_cmd(char package)
{
    // send START
    //IFS3bits.MI2C2IF = 0;
    I2C2CONbits.SEN = 1;
    while(I2C2CONbits.SEN == 1);
    
    // send Address and Write command
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b01111100;
    while(IFS3bits.MI2C2IF == 0);
    
    // send High byte (always 0x00)
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b00000000;
    while(IFS3bits.MI2C2IF == 0);
    
    // send Package
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = package;
    while(IFS3bits.MI2C2IF == 0);
    
    // send STOP
    IFS3bits.MI2C2IF = 0;
    I2C2CONbits.PEN = 1;
    while(I2C2CONbits.PEN == 1);
        
}
// places the cursor on the display given an x and y position
void lcd_setCursor(int x, int y)
{        
    lcd_cmd(128+64*y+x);
}
// if dir = 0 animates the display to sweep left, if dir = 1 display sweeps right
void lcd_shift(int dir)
{
    lcd_cmd(24+4*dir);
}
// uses i2c to print a given char to the LCD display
void lcd_printChar(char package)
{
    // send START
    //IFS3bits.MI2C2IF = 0;
    I2C2CONbits.SEN = 1;
    while(I2C2CONbits.SEN == 1);
    
    // send Address and Write command
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b01111100;
    while(IFS3bits.MI2C2IF == 0);
    
    // send High byte
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b11000000;
    while(IFS3bits.MI2C2IF == 0);
    
    // send Package
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = package;
    while(IFS3bits.MI2C2IF == 0);
    
    // send STOP
    IFS3bits.MI2C2IF = 0;
    I2C2CONbits.PEN = 1;
    while(I2C2CONbits.PEN == 1);
        
}
// uses i2c to print a "string" to the LCD display
void lcd_printStr(char strArr[])
{
    int i;
    int len = strlen(strArr) - 1;
    
    // send START bit
    I2C2CONbits.SEN = 1;
    while(I2C2CONbits.SEN == 1);
        
    // send Address and Write command
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b01111100;
    while(IFS3bits.MI2C2IF == 0);
    
    for(i=0;i<len;i++)
    {        
        // send Control Byte: CO = 1, RS = 1
        IFS3bits.MI2C2IF = 0;
        I2C2TRN = 0b11000000;
        while(IFS3bits.MI2C2IF == 0);
        
        // send Letter
        IFS3bits.MI2C2IF = 0;
        I2C2TRN = strArr[i];
        while(IFS3bits.MI2C2IF == 0);
    }
    
    // send last Control Byte: CO = 0, RS = 1
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = 0b01000000;
    while(IFS3bits.MI2C2IF == 0);
    
    // send last letter
    IFS3bits.MI2C2IF = 0;
    I2C2TRN = strArr[len];
    while(IFS3bits.MI2C2IF == 0);
    
    // send STOP
    I2C2CONbits.PEN = 1;
    while(I2C2CONbits.PEN == 1);
}