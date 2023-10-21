
/************************************************************************
*                               Led Task                                *
*************************************************************************
* FileName:         led_task.c                                          *
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
* F.Ficili     28/02/15    1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "led_task.h"

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Static Variables
************************************************************************/

/************************************************************************
* Local Prototypes
************************************************************************/
LedOutType Led1BlinkStateMachine (void);
LedOutType Led2BlinkStateMachine (void);

/************************************************************************
* Function Prototypes
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     LedTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Manage LED task
* Date:		28/02/15
************************************************************************/
void LedTask (void)
{
    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Initialize LEDs pins */
            LED_1_TRIS = LINE_DIRECTION_OUTPUT;
            LED_1 = LINE_STATE_LOW;
            break;

        /* System Normal operaion Phase */
        case RunningState:
            /* Run LED_1 state machine */
            //LED_1 = Led1BlinkStateMachine();
            LED_1 = Led2BlinkStateMachine();
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     Led1BlinkStateMachine
* Input:        void
* Output:       LedOutType
* Author:       F.Ficili
* Description:	Blinking LED effect state machine
* Date:		01/03/15
************************************************************************/
LedOutType Led1BlinkStateMachine (void)
{
    /* State machine static variables */
    static LedBlinkSm1Type LedBlinkSmState = WaitState;
    static UINT16 LedBlinkSmCounter = 0;
    static LedOutType LedBlinkSmOut = OffState;

    switch (LedBlinkSmState)
    {
        case WaitState:
            /* Increment counter */
            LedBlinkSmCounter++;
            /* Check time */
            if (LedBlinkSmCounter >= LED_1_BLINK_PERIOD_MS)
            {
                /* Reset counter */
                LedBlinkSmCounter = 0;
                /* Jump to ToggleState */
                LedBlinkSmState = ToggleState;
            }
            break;

        case ToggleState:
            /* Toggle LED output state  */
            LedBlinkSmOut = ~LedBlinkSmOut;
            /* Jump to WaitState */
            LedBlinkSmState = WaitState;
            break;

        default:
            break;
    }

    /* Return out state */
    return (LedBlinkSmOut);
}

/************************************************************************
* Function:     Led2BlinkStateMachine
* Input:        void
* Output:       LedOutType
* Author:       F.Ficili
* Description:	Blinking LED effect state machine
* Date:		01/03/15
************************************************************************/
LedOutType Led2BlinkStateMachine (void)
{
    static LedBlinkSm2Type LedBlinkSmState = WaitState;
    static UINT16 LedBlinkSmCounter = 0;
    static LedOutType LedBlinkSmOut = OffState;
    
    switch (LedBlinkSmState)
    {
        case WaitStateL2:
            /* Increment counter */
            LedBlinkSmCounter++;

            if ((LedBlinkSmCounter >= LED_2_BLINK_OFF_PERIOD_MS) && (LedBlinkSmOut == OffState))
            {
                /* Reset counter */
                LedBlinkSmCounter = 0;
                /* Jump to OnState */
                LedBlinkSmState = OnStateL2;
            }
            else if ((LedBlinkSmCounter >= LED_2_BLINK_ON_PERIOD_MS) && (LedBlinkSmOut == OnState))
            {
                /* Reset counter */
                LedBlinkSmCounter = 0;
                /* Jump to OffState */
                LedBlinkSmState = OffStateL2;
            }
            break;

        case OnStateL2:
            /* Set output */
            LedBlinkSmOut = OnState;
            /* Jump to WaitState */
            LedBlinkSmState = WaitStateL2;
            break;

        case OffStateL2:
            /* Set output */
            LedBlinkSmOut = OffState;
            /* Jump to WaitState */
            LedBlinkSmState = WaitStateL2;
            break;

        default:
            break;
    }

    /* Return out state */
    return (LedBlinkSmOut);
}

