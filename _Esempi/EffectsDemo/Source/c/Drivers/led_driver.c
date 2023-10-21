/************************************************************************
*                               LCD Driver                              *
*************************************************************************
* FileName:         lcd_driver.c                                        *
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
* F.Ficili     16/09/15     1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "led_driver.h"

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
* Function:     LedBlinkStateMachine
* Input:        LedBlinkType *LedBlink
*		LedOutStateType LedInitStatus
* Output:       UINT8
* Author:       F.Ficili
* Description:	Blinking LED effect state machine
* Date:		16/09/15
************************************************************************/
UINT8 LedBlinkStateMachine (LedBlinkType *LedBlink, LedOutStateType LedInitStatus)
{
    /* State Machine */
    switch (LedBlink->LedBlinkState)
    {
        case LedBlinkInit:
            /* Initialize Led Out State */
            LedBlink->LedOutState = LedInitStatus;
            /* Go to LedBlinkRunning State */
            LedBlink->LedBlinkState = LedBlinkRunning;
            break;

        case LedBlinkRunning:
            /* Increment counter */
            LedBlink->LedBlinkCounter++;
            /* If Led is in off state */
            if (LedBlink->LedOutState == OffState)
            {
                /* If off time is expired */
                if (LedBlink->LedBlinkCounter >= LedBlink->LedOffTimeMs)
                {
                    /* Reset counter */
                    LedBlink->LedBlinkCounter = 0;
                    /* Switch status */
                    LedBlink->LedOutState = OnState;
                }
            }
            else if (LedBlink->LedOutState == OnState)
            {
                /* If on time is expired */
                if (LedBlink->LedBlinkCounter >= LedBlink->LedOnTimeMs)
                {
                    /* Reset counter */
                    LedBlink->LedBlinkCounter = 0;
                    /* Switch status */
                    LedBlink->LedOutState = OffState;
                }
            }
            break;

        default:
            break;
    }
    /* Return Status */
    return (LedBlink->LedOutState);
}


