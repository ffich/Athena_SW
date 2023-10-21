
/************************************************************************
*                               Led Task                                *
*************************************************************************
* FileName:         led_task.c                                          *
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
* F.Ficili     28/02/15    1.0          First release                   *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "led_task.h"


/************************************************************************
* Global Variables
************************************************************************/
EventStructureType Led2On = {0, EventIdle};
EventStructureType Led2Off = {0, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/
/* Init counter */
static UINT16 InitCounter = 0;
/* Led 1 blink variable */
static LedBlinkType Led1 = {LedBlinkInit, OffState, 0, L1_RUNNING_ON_TIME_MS, L1_RUNNING_OFF_TIME_MS};
/* Led 2 blink variable */
static LedBlinkType Led2 = {LedBlinkInit, OffState, 0, L2_RUNNING_ON_TIME_MS, L2_RUNNING_OFF_TIME_MS};

/************************************************************************
* Local Prototypes
************************************************************************/


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
* Author:	    F.Ficili
* Description:	 Manage LED task
* Date:         28/02/15
************************************************************************/
void LedTask (void)
{    
    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Initialize LEDs pins */
            BSP_LED_1_TRIS = LINE_DIRECTION_OUTPUT;
            BSP_LED_2_TRIS = LINE_DIRECTION_OUTPUT;
            BSP_LED_1 = LINE_STATE_LOW;
            BSP_LED_2 = LINE_STATE_LOW;            
            break;

        /* System Normal operaion Phase */
        case RunningState:

            /* Run BSP_LED_1 state machine */
            BSP_LED_1 = LedBlinkStateMachine(&Led1,OffState);

            /* If a Led on evt i received */
            if (ReceiveEvt(&Led2On))
            {
                /* Turn on LED */
                BSP_LED_2 = LED_ON;
            }
            else if (ReceiveEvt(&Led2Off))
            {
                /* Turn off LED */
                BSP_LED_2 = LED_OFF;
            }
            else
            {
                /* Do nothing */
            }

            break;

        /* Default */
        default:
            break;
    }
}




