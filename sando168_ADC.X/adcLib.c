
#include "xc.h"
#include "adcLib.h"

int adc_buffer[BUFSIZE];
int buffer_index = 0;
double avg;

void adc_init()
{
    TRISAbits.TRISA0 = 1;   // should be input by default, but just in case
    
    AD1PCFGbits.PCFG0 = 0;  // setup I/O
    
    AD1CON2bits.VCFG = 0b000;   // use AVDD (3.3V) and AVSS (0V) as max/min
    AD1CON3bits.ADCS = 0b001;   // TAD >= 75 ns
    AD1CON1bits.SSRC = 0b010;   // timer3
    AD1CON3bits.SAMC = 0b001;   // 
    AD1CON1bits.FORM = 0b000;   // data output form -- unsigned int

    
    
    AD1CON1bits.ASAM = 0b001;   // sampling begins immediately after las conversion completes
    AD1CON2bits.SMPI = 0b000;   // interrupts at the completion of conversion for each __th sample/convert seq
    AD1CON1bits.ADON = 1;       // turn on the ADC
    
    _AD1IF = 0;     // clear AD1 Interrupt Flag
    _AD1IE = 1;     // enable AD1 Interrupt
    
    TMR3 = 0;       // setup Timer3
    T3CON = 0;
    T3CONbits.TCKPS = 0b10;
    PR3 = 15624;
    T3CONbits.TON = 1;
    
}

void timer1_init()
{
    TMR1 = 0;
    T1CON = 0;
    T1CONbits.TCKPS = 0b10;     // prescaler of 64
    PR1 = 25000 - 1;            // count to 100 ms
    T1CONbits.TON = 1;          // turn on timer1
    _T1IF = 0;
}



void putVal(int ADCval)
{
    adc_buffer[ buffer_index++ ] = ADCval;
    if( buffer_index >= BUFSIZE ){
        buffer_index = 0;
    }
}

void init_Buffer()
{
    int i;
    for( i=0; i<BUFSIZE; i++ ){
        adc_buffer[i] = 0;
    }
}

double getAvg()
{
    int i;
    int overflow;
    double sum = 0;
           
    if( buffer_index < NUMSAMPLES )
    {
        overflow = NUMSAMPLES - buffer_index;
        for( i=buffer_index; i>=0; i-- )
        {
            sum = sum + adc_buffer[i];
        }
        for( i=NUMSAMPLES; i>=NUMSAMPLES-overflow; i-- )
        {
            sum = sum + adc_buffer[i];
        }
    } else{
        
        for( i=buffer_index - NUMSAMPLES; i<buffer_index; i++ )
        {
            sum = sum + adc_buffer[i];
        }
    }
    
    double avg = sum / NUMSAMPLES;
    
    return avg;
}

void __attribute__((__interrupt__,__auto_psv__))_ADC1Interrupt(void)
{
    putVal(ADC1BUF0);
    _AD1IF = 0;
    _T3IF = 0;
}
