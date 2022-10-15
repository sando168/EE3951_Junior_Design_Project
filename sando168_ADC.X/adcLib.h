/* 
 * File:   adcLib.h
 * Author: User
 *
 * Created on April 1, 2021, 10:16 PM
 */

#ifndef ADCLIB_H
#define	ADCLIB_H

#ifdef	__cplusplus
extern "C" {
#endif
    

#define BUFSIZE 1024
#define NUMSAMPLES 20
    
void adc_init(void);
void timer1_init(void);
void putVal(int ADCval);
void init_Buffer(void);
double getAvg(void);

void __attribute__((__interrupt__,__auto_psv__))_ADC1Interrupt(void);

#ifdef	__cplusplus
}
#endif

#endif	/* ADCLIB_H */

