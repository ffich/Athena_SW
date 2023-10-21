/************************************************************************
*                            Hardware Profile                           *
*************************************************************************
* FileName:         hw_profile.h                                        *
* Processor:        Pic32MX                                             *
* Compiler:         XC32                                                *
* Author:           F.Ficili                                            *
*									*
* Software License Agreement						*
*									*
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,     *
* WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED     *
* TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A		*
* PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE AUTHOR SHALL NOT,	*
* IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR		*
* CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.			*
*									*
* --------------------------------------------------------------------- *
* Responsible For This File: Francesco Ficili				*
*									*
* --------------------------------------------------------------------- *
* Author       Date        Version      Comment                         *
* ---------------------------------------------------------------------	*
* F.Ficili     14/02/15    1.0          First release			*
************************************************************************/

#ifndef HW_PROFILE_H
#define	HW_PROFILE_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "common.h"

/************************************************************************
* Hardware Basic Defines
************************************************************************/
#define USE_DEMOBOARD

/* Data direction */
#define LINE_DIRECTION_INPUT				((UINT8)(1))
#define LINE_DIRECTION_OUTPUT				((UINT8)(0))

/* Digital state */
#define LINE_STATE_HIGH					((UINT8)(1))
#define LINE_STATE_LOW					((UINT8)(0))

/************************************************************************
* Device Hardware Profile
************************************************************************/

/************************************************************************
* User LEDs
************************************************************************/
#ifdef USE_DEMOBOARD
/* Data direction register */
#define BSP_LED_1_TRIS					TRISDbits.TRISD1
#define BSP_LED_2_TRIS					TRISDbits.TRISD2

/* Resource Alias */
#define BSP_LED_1 					PORTDbits.RD1
#define BSP_LED_2 					PORTDbits.RD2
#endif

/************************************************************************
* LCD Interface
************************************************************************/
/* Data direction register */
#define BSP_LCD_D0_TRIS                                 TRISGbits.TRISG12
#define BSP_LCD_D1_TRIS                                 TRISGbits.TRISG14
#define BSP_LCD_D2_TRIS                                 TRISEbits.TRISE1
#define BSP_LCD_D3_TRIS                                 TRISEbits.TRISE0
#define BSP_LCD_D4_TRIS                                 TRISAbits.TRISA7
#define BSP_LCD_D5_TRIS                                 TRISAbits.TRISA6
#define BSP_LCD_D6_TRIS                                 TRISGbits.TRISG0
#define BSP_LCD_D7_TRIS                                 TRISGbits.TRISG1
#define BSP_LCD_EN_TRIS                                 TRISEbits.TRISE4
#define BSP_LCD_RS_TRIS                                 TRISEbits.TRISE2
#define BSP_LCD_RW_TRIS                                 TRISEbits.TRISE3
#define BSP_LCD_BKL_TRIS                                TRISGbits.TRISG13

/* Resource Alias */
#define BSP_LCD_D0_PIN                                  PORTGbits.RG12
#define BSP_LCD_D1_PIN                                  PORTGbits.RG14
#define BSP_LCD_D2_PIN                                  PORTEbits.RE1
#define BSP_LCD_D3_PIN                                  PORTEbits.RE0
#define BSP_LCD_D4_PIN                                  PORTAbits.RA7
#define BSP_LCD_D5_PIN                                  PORTAbits.RA6
#define BSP_LCD_D6_PIN                                  PORTGbits.RG0
#define BSP_LCD_D7_PIN                                  PORTGbits.RG1
#define BSP_LCD_EN_PIN                                  PORTEbits.RE4
#define BSP_LCD_RS_PIN                                  PORTEbits.RE2
#define BSP_LCD_RW_PIN                                  PORTEbits.RE3
#define BSP_LCD_BKL_PIN                                 PORTGbits.RG13

/************************************************************************
* Joystick Interface
************************************************************************/
/* Data direction register */
#define BSP_JOYSTICK_UP_TRIS                            TRISBbits.TRISB11
#define BSP_JOYSTICK_DOWN_TRIS                          TRISBbits.TRISB10
#define BSP_JOYSTICK_RIGHT_TRIS                         TRISBbits.TRISB12
#define BSP_JOYSTICK_LEFT_TRIS                          TRISBbits.TRISB9
#define BSP_JOYSTICK_FIRE_TRIS                          TRISBbits.TRISB13

/* Resource Alias */
#define BSP_JOYSTICK_UP                                 PORTBbits.RB11
#define BSP_JOYSTICK_DOWN                               PORTBbits.RB10
#define BSP_JOYSTICK_RIGHT                              PORTBbits.RB12
#define BSP_JOYSTICK_LEFT                               PORTBbits.RB9
#define BSP_JOYSTICK_FIRE                               PORTBbits.RB13

/************************************************************************
* Button Interface
************************************************************************/
/* Data direction register */
#define BSP_BUTTON_1_TRIS                               TRISBbits.TRISB8

/* Resource Alias */
#define BSP_BUTTON_1                                    PORTBbits.RB8

#endif	/* HW_PROFILE_H */

