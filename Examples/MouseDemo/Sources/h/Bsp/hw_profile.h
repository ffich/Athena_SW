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
/* Data direction */
#define LINE_DIRECTION_INPUT				((UINT8)(1))
#define LINE_DIRECTION_OUTPUT				((UINT8)(0))

/* Digital state */
#define LINE_STATE_HIGH					((UINT8)(1))
#define LINE_STATE_LOW					((UINT8)(0))

/************************************************************************
* Device Hardware Profile
************************************************************************/
//#define USE_SELF_POWER_SENSE_IO
#define tris_self_power                                 TRISAbits.TRISA2
#define self_power                                      ((UINT8)(1))

//#define USE_USB_BUS_SENSE_IO
#define tris_usb_bus_sense                              TRISBbits.TRISB5  
#define USB_BUS_SENSE                                   ((UINT8)(1))

#define INPUT_PIN                                       ((UINT8)(1))
#define OUTPUT_PIN                                      ((UINT8)(0))

/* Digital state */
#define LINE_STATE_HIGH					((UINT8)(1))
#define LINE_STATE_LOW					((UINT8)(0))

/************************************************************************
* User LEDs
************************************************************************/
/* Data direction register */
#define LED_1_TRIS					TRISDbits.TRISD1
#define LED_2_TRIS					TRISDbits.TRISD2

/* Resource Alias */
#define LED_1 						PORTDbits.RD1
#define LED_2 						PORTDbits.RD2

/************************************************************************
* User Joystick
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


#endif	/* HW_PROFILE_H */

