/************************************************************************
*                          Joystick Driver                              *
*************************************************************************
* FileName:         joystick_driver.c                                   *
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
* Author       Date         Version      Comment                        *
* ---------------------------------------------------------------------	*
* F.Ficili     09/09/15     1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "joystick_driver.h"

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Static Variables
************************************************************************/


/************************************************************************
* Local Prototypes
************************************************************************/


/************************************************************************
* LOCAL Functions Implementation
************************************************************************/


/************************************************************************
* GLOBAL Functions Implementation
************************************************************************/
/************************************************************************
* Function:     Joystick_InitJoystick
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Init joystick interface.
* Date:		09/09/15
************************************************************************/
void Joystick_InitJoystick (void)
{
    #ifdef ADC_REG_OVERCOME
        /* Init all pin as digital */
        AD1PCFG = 0xFFFF;
    #endif

    /* All lines in input */
    JOYSTICK_UP_TRIS = LINE_DIRECTION_INPUT;
    JOYSTICK_DOWN_TRIS = LINE_DIRECTION_INPUT;
    JOYSTICK_RIGHT_TRIS = LINE_DIRECTION_INPUT;
    JOYSTICK_LEFT_TRIS = LINE_DIRECTION_INPUT;
    JOYSTICK_FIRE_TRIS = LINE_DIRECTION_INPUT;
}

/************************************************************************
* Function:     Button_InitButton
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Init Button interface.
* Date:		09/09/15
************************************************************************/
void Button_InitButton (void)
{
    /* Button line in input */
    BUTTON_1_TRIS = LINE_DIRECTION_INPUT;
}

/************************************************************************
* Function:     Joystick_GetJoystickState
* Input:        None
* Output:       JoystickStateType
* Author:	F.Ficili
* Description:	Gest the joystick state.
* Date:		09/09/15
************************************************************************/
JoystickStateType Joystick_GetJoystickState (void)
{
    /* Service variable */
    JoystickStateType JoystickState = JoystickNone;

    if (JOYSTICK_UP == LINE_STATE_LOW)
    {
        /* Up */
        JoystickState = JoystickUp;
    }
    else if (JOYSTICK_DOWN == LINE_STATE_LOW)
    {
        /* Down */
        JoystickState = JoystickDown;
    }
    else if (JOYSTICK_LEFT == LINE_STATE_LOW)
    {
        /* Left */
        JoystickState = JoystickLeft;
    }
    else if (JOYSTICK_RIGHT == LINE_STATE_LOW)
    {
        /* Right */
        JoystickState = JoystickRight;
    }
    /* Check status */
    else if (JOYSTICK_FIRE == LINE_STATE_LOW)
    {
        /* Fire */
        JoystickState = JoystickFire;
    }
    else
    {
        /* None */
        JoystickState = JoystickNone;
    }

    /* Return state */
    return JoystickState;
}

/************************************************************************
* Function:     Button_GetButtonState
* Input:        None
* Output:       ButtonStateType
* Author:	F.Ficili
* Description:	Gest the button state.
* Date:		09/09/15
************************************************************************/
ButtonStateType Button_GetButtonState (void)
{
    /* Service variable */
    ButtonStateType ButtonState = ButtonNotPressed;

    /* Check button state */
    if (BUTTON_1 == LINE_STATE_LOW)
    {
        ButtonState = ButtonPressed;
    }
    else
    {
        ButtonState = ButtonNotPressed;
    }

    /* Return state */
    return ButtonState;
}





