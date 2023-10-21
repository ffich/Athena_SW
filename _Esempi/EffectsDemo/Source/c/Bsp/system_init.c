/************************************************************************
*                              System Init                              *
*************************************************************************
* FileName:         system_init.c                                       *
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

/************************************************************************
* Includes
************************************************************************/
#include "system_init.h"

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Local Prototypes
************************************************************************/
void InitSchedTimer (void);

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     SystemInit
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Global system inizialization
* Date:		14/02/15
************************************************************************/
void SystemInit (void)
{
    /* Initialize timer 1 as the scheduler timer */
    InitSchedTimer();
}

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     InitSchedTimer
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initialize timer 2 as scheduler timebase:
*               Prescaler: 1/8; Actual Interrupt Time: 1 ms
* Date:		14/02/15
************************************************************************/
void InitSchedTimer (void)
{
    /* configure the PIC32 core for the best performance */
    SYSTEMConfigPerformance(SYSTEM_FREQUENCY_VALUE_HZ);

    /* set T1CON register */
    T2CONbits.ON = K_ON;
    T2CONbits.TCKPS = TMR_PRESCALER_8;
    T2CONbits.T32 = TMR_16_BIT_MODE;
    T2CONbits.TCS = TMR_CS_PBCLK;
    PR2 = INT_MATCH_VALUE;

    /* set interrupt register */
    IPC2bits.T2IP = T2_INT_PRIO_1;
    IPC2bits.T2IS = T2_INT_SUB_PRIO_0;
    IEC0bits.T2IE = T2_INT_ENABLE;

    /* enable multi-vectored interrupts */
    INTEnableSystemMultiVectoredInt();
}

