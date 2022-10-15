/* 
 * File:   displayLCD.h
 * Author: User
 *
 * Created on March 29, 2021, 11:30 PM
 */

#ifndef DISPLAYLCD_H
#define	DISPLAYLCD_H

#ifdef	__cplusplus
extern "C" {
#endif

void lcd_init();
void lcd_cmd(char package);
void lcd_setCursor(int x, int y);
void lcd_printChar(char package);
void lcd_printStr(char charArr[]);
void lcd_shift(int dir);

#ifdef	__cplusplus
}
#endif

#endif	/* DISPLAYLCD_H */

