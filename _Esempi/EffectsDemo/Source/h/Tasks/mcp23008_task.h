/************************************************************************
*                           MCP23008 Task                               *
*************************************************************************
* FileName:         mcp23008_task.h                                     *
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
* F.Ficili     14/09/15   1.0          First release			*
************************************************************************/

#ifndef MCP_23008_TASK_H
#define	MCP_23008_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "lcd_driver.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define MCP23008_TASK_PERIOD_MS                         ((UINT16)(5)/SCHEDULER_PERIOD_MS)

/* Timing Constants */
#define SHIFT_DELAY_MS                                  ((UINT16)(20)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define ALT_BLK_DELAY_MS                                ((UINT16)(500)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define EFFECT_DURATION_MS                              ((UINT16)(5000)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)

#define MAX_STEP_NUMB                                   ((UINT8)(7))
#define MIN_STEP_NUMB                                   ((UINT8)(0))

#define MAX_STEP_NUMB_CS                                ((UINT8)(5))
#define MIN_STEP_NUMB_CS                                ((UINT8)(2))

#define TX_BUFFER_ELEMENTS                              ((UINT8)(2))
#define MCP23008_I2C_ADDR                               ((UINT8)(0x40))

#define MCP23008_DDR_REG                                ((UINT8)(0x00))
#define MCP23008_PORT_REG                               ((UINT8)(0x09))
#define MCP23008_ALL_PIN_OUTPUT                         ((UINT8)(0x00))

#define LED_ON_RIGHT                                    ((UINT8)(0x03))
#define LED_ON_LEFT                                     ((UINT8)(0xC0))

#define LED_ALL_OFF                                     ((UINT8)(0x00))
#define LED_ALL_ON                                      ((UINT8)(0xFF))

#define LED_RIGHT_HALF_ON                               ((UINT8)(0x0F))
#define LED_LEFT_HALF_ON                                ((UINT8)(0xF0))

#define IDLE                                            ((UINT8)(0))
#define BEGIN_WRITE_PROCEDURE                           ((UINT8)(1))

#define NOT_ACCESSIBLE                                  ((UINT8)(0))
#define ACCESSIBLE                                      ((UINT8)(1))

#define TENTATIVE_NUMBER                                ((UINT8)(3))

#define MAX_TH_MS                                       ((UINT16)(250)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define MIN_TH_MS                                       ((UINT16)(10)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)

/************************************************************************
* Global Variables
************************************************************************/
extern EventStructureType ActivateMcp23008Task;
extern EventStructureType DeactivateMcp23008Task;

/************************************************************************
* Typedef
************************************************************************/
/* State machine states enum */
typedef enum _SupercarState
{
    InitPortExState,
    InitOutputState,
    ShiftState,
    SendDataState,
    WaitState
} SupercarStateType;

/* State machine states enum */
typedef enum _WriteState
{
    Idle,
    SetValue,
    Write,
    Complete
} WriteStateType;

/* Shift direction state */
typedef enum _ShiftDirection
{
    GoLeft,
    GoRight,
} ShiftDirectionType;

/* Alternate blink state */
typedef enum _AltBlkStateType
{
   OnLeftState,
   OnRightState,
   AbSendDataState
} AltBlkStateType;

/* Mixed effects state */
typedef enum _MixedEffectStateType
{
   SupCarEffState,
   CrsSupCarEffState,
   AltBlkEffState,
   TransitionState,           
} MixedEffectStateType;

/************************************************************************
* Function
************************************************************************/
/* Mcp23008 task */
void Mcp23008Task (void);

#endif	/* MCP_23008_TASK_H */

