/************************************************************************
*                          Joystick Driver                              *
*************************************************************************
* FileName:         joystick_driver.h                                   *
* Processor:        Pic32MX                                             *
* Compiler:         XC32                                                *
* Author:           F.Ficili                                            *
*                                                                       *
* Software License Agreement                                            *
*                                                                       *
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,     *
* WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED     *
* TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A           *
* PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE AUTHOR SHALL NOT,      *
* IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR            *
* CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.                     *
*                                                                       *
* --------------------------------------------------------------------- *
* Responsible For This File: Francesco Ficili                           *
*                                                                       *
* --------------------------------------------------------------------- *
* Author       Date        Version      Comment                         *
* ---------------------------------------------------------------------	*
* F.Ficili     09/09/15     1.0          First release                  *
************************************************************************/

#ifndef JOYSTICK_DRIVER_H
#define	JOYSTICK_DRIVER_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "GenericTypeDefs.h"
#include "hw_profile.h"
#include "common.h"

/************************************************************************
* Defines
************************************************************************/
/* Data direction registers */
#define JOYSTICK_UP_TRIS                                BSP_JOYSTICK_UP_TRIS
#define JOYSTICK_DOWN_TRIS                              BSP_JOYSTICK_DOWN_TRIS
#define JOYSTICK_RIGHT_TRIS                             BSP_JOYSTICK_RIGHT_TRIS
#define JOYSTICK_LEFT_TRIS                              BSP_JOYSTICK_LEFT_TRIS
#define JOYSTICK_FIRE_TRIS                              BSP_JOYSTICK_FIRE_TRIS

#define BUTTON_1_TRIS                                   BSP_BUTTON_1_TRIS

/* Port's pins */
#define JOYSTICK_UP                                     BSP_JOYSTICK_UP
#define JOYSTICK_DOWN                                   BSP_JOYSTICK_DOWN
#define JOYSTICK_RIGHT                                  BSP_JOYSTICK_RIGHT
#define JOYSTICK_LEFT                                   BSP_JOYSTICK_LEFT
#define JOYSTICK_FIRE                                   BSP_JOYSTICK_FIRE

#define BUTTON_1                                        BSP_BUTTON_1

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Typedef
************************************************************************/
/* Joystick state enum */
typedef enum _JoystickState
{
    JoystickNone,
    JoystickUp,
    JoystickDown,
    JoystickRight,
    JoystickLeft,
    JoystickFire
} JoystickStateType;

/* Button state enum */
typedef enum _ButtonState
{
    ButtonNotPressed,
    ButtonPressed,
} ButtonStateType;

/************************************************************************
* Function
************************************************************************/
void Joystick_InitJoystick (void);
JoystickStateType Joystick_GetJoystickState (void);

#endif	/* LCD_DRIVER_H */

