/************************************************************************
*                               Adc Task                                *
*************************************************************************
* FileName:         adc_task.c                                          *
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
* F.Ficili     11/04/15     1.0          First release                  *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "adc_task.h"
#include "stdlib.h"

/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
EventStructureType ActivateAdcTask = {NO_MASK, EventIdle};
EventStructureType DeactivateAdcTask = {NO_MASK, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/
void InitAdc (void);
void AdcAcquire (void);

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     AdcTask
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Manage ADC task activities
* Date:		    11/04/15
************************************************************************/
void AdcTask (void)
{
    /* Task status */
    static UINT8 TaskStatus = K_TASK_NOT_RUNNING;

    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Init ADC */
            InitAdc();
            break;

        /* System Normal operation Phase */
        case RunningState:
            /* Check activation/deactivation events */
            if (ReceiveEvt(&ActivateAdcTask))
            {
                /* Activate task */
                TaskStatus = K_TASK_RUNNING;
            }
            else if (ReceiveEvt(&DeactivateAdcTask))
            {
                /* Deactivate task */
                TaskStatus = K_TASK_NOT_RUNNING;;
            }
            else
            {
                /* Do nothing */
            }

            /* Check task status */
            if (TaskStatus == K_TASK_RUNNING)
            {
                /* Acquire ADC data */
                AdcAcquire();
            }
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
* Function:     void InitAdc (void)
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Initalize ADC module.
* Date:         30/09/2015
************************************************************************/
void InitAdc (void)
{
    /* Init ADC */
    Adc_SetConfig();
    Adc_InitAdcModule(&Adc_AdcConfig);
    Adc_SetInputConfig(&Adc_InputConfig);
    Adc_SetPortConfig(&Adc_PortConfig);
    Adc_AutoScanConfig(&Adc_AutoscanConfig);
}

/************************************************************************
* Function:     AdcAcquire
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Acquire analog data.
* Date:         30/09/15
************************************************************************/
void AdcAcquire (void)
{
    static AdcStateType AdcState = AdcStartSamp;
    static UINT8 AdcResultPerc;
    static UINT8 LcdStr[4];

    switch (AdcState)
    {
        case AdcStartSamp:
            /* Sample data */
            Adc_SampleData();
            /* Change state */
            AdcState = AdcStartConv;
            break;

        case AdcStartConv:
            /* Convert data */
            Adc_ConvertData();
            /* Change state */
            AdcState = AdcCheckSampConv;
            break;

        case AdcCheckSampConv:
            /* Check if conversion is complete */
            if (Adc_IsConvComplete())
            {
                /* Change state */
                AdcState = AdcGetRes;
            }
            else
            {
                /* Change state */
                AdcState = AdcCheckSampConv;
            }
            break;

        case AdcGetRes:
            /* Clear LCD */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Get result in percentage */
            AdcResultPerc = Adc_GetConvResultPerc();
            /* Convert to ASCII */
            ltoa(LcdStr,AdcResultPerc,10);
            /* Move cursor to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString("Pots: ");
            /* Value of pot 1*/
            Lcd_WriteString(LcdStr);
            Lcd_WriteChar('%');
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Change state */
            AdcState = AdcStartSamp;
            break;

        default:
            break;
    }
}

