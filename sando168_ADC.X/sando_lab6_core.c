/*
 * File:   sando_lab6_core.c
 * Author: User
 *
 * Created on April 1, 2021, 9:19 PM
 */

#pragma config ICS = PGx1
#pragma config FWDTEN = OFF
#pragma config GWRP = OFF
#pragma config GCP = OFF
#pragma config JTAGEN = OFF

#pragma config I2C1SEL = PRI
#pragma config IOL1WAY = OFF
#pragma config OSCIOFNC = ON
#pragma config FCKSM = CSECME

#pragma config FNOSC = FRCPLL

#include "xc.h"
#include <stdio.h>
#include "displayLCD.h"
#include "adcLib.h"

void pic24_init(void);
void loop(void);

int main(void) {
    
    pic24_init();   // Initialize PIC
    lcd_init();     // Initialize LCD display
    adc_init();     // Initialize PIC register for analog input
    timer1_init();  // Initialize timer1 to output value to LCD every 100 microseconds
    init_Buffer();  // Initialize buffer that will store extra analog values to all zeroes
    
    loop();         // See code below
    
    return 0;
}

void pic24_init()
{
    _RCDIV = 0;
    AD1PCFG = 0xffff;
}

void loop(void)
{
    char output[20];    
    
    lcd_setCursor(0,0);     // set LCD to display values starting at the top left
    lcd_printStr("Start");  // random start indicator I put in
    double avg;
        
    while(1)
    {
        avg = getAvg();     // constantly get the average of the buffer values
        while(_T1IF == 0);  // Wait for timer1 to reset
        if(1)
        {
            _T1IF = 0;
            // reset timer1 interrupt flag to zero
            
            sprintf( output, "%6.4f V", (3.3/1024)*avg);
            // get avg multiply by 3.3 (3.3V) and divide by 1024
            // then convert to string which displays the value to four decimal places
            // store in char array variable output
            
            // print avg to the lcd
            lcd_setCursor(0,0);
            lcd_printStr(output);
        }
    }
}