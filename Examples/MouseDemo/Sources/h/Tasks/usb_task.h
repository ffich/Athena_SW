/************************************************************************
*                               Usb Task                                *
*************************************************************************
* FileName:         usb_task.h                                          *
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
* F.Ficili     28/02/15   1.0          First release			*
************************************************************************/

#ifndef USB_TASK_H
#define	USB_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "usb_device.h"
#include "usb_function_hid.h"
#include "lcd_driver.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define USB_TASK_PERIOD_MS                      ((UINT16)(10)/SCHEDULER_PERIOD_MS)

#define JOY_SPEED                               ((UINT8)(3))
#define MOVE_UP                                 ((INT8)(-1))
#define MOVE_DOWN                               ((INT8)(1))
#define MOVE_LEFT                               ((INT8)(-1))
#define MOVE_RIGHT                              ((INT8)(1))
#define FIRE_ON                                 ((INT8)(1))
#define JOY_TIME_UP_MS                          ((UINT16)(250)/USB_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
#define JOY_TIME_DOWN_MS                        ((UINT16)(500)/USB_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
#define JOY_TIME_LEFT_MS                        ((UINT16)(250)/USB_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
#define JOY_TIME_RIGHT_MS                       ((UINT16)(500)/USB_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)

#define HID_REPORT_BUTTON                       ((UINT8)(0))
#define HID_REPORT_X_AXIS                       ((UINT8)(1))
#define HID_REPORT_Y_AXIS                       ((UINT8)(2))

#define SEQ_STEP_1                              ((UINT8)(0))
#define SEQ_STEP_2                              ((UINT8)(1))
#define SEQ_STEP_3                              ((UINT8)(2))

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Typedef
************************************************************************/
/* Joyustick emulation state enum */
typedef enum JoystickStateEnum
{
    MoveUp,
    MoveDown,
    MoveLeft,
    MoveRight,
    FireButton,
    DoNothing,
} JoystickStateType;

/************************************************************************
* Function
************************************************************************/
/* Usb task */
void UsbTask (void);

#endif	/* USB_TASK_H */

