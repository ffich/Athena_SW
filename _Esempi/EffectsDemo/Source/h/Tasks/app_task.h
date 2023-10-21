/************************************************************************
*                               App Task                                *
*************************************************************************
* FileName:         app_task.h                                          *
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
* F.Ficili     16/09/15   1.0          First release			*
************************************************************************/

#ifndef APP_TASK_H
#define	APP_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"


/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define APP_TASK_PERIOD_MS                      ((UINT16)(100)/SCHEDULER_PERIOD_MS)

#define NO_SELECTION                            "Select Demo:"
#define I2C_LCD_STRING                          "I2C Demo"
#define ADC_LCD_STRING                          "ADC Demo"
#define UART_LCD_STRING                         "UART Demo"
#define USB_HOST_LCD_STRING                     "USB Host Demo"
#define TCPIP_LCD_STRING                        "TCP/IP Demo"
#define CREDITS_LCD_STRING                      "Credits"

#define UP_DOWN_INDICATION                      "Up/Dwn to select"
#define SELECTION_INDICATION                    "-> To Select"
#define EXIT_INDICATION                         "<- To Exit"

#define I2C_LCD_DEMO_STRING                     "Supercar"
#define ADC_LCD_DEMO_STRING                     "Pots: "
#define UART_LCD_DEMO_STRING                    "UART Coms"
#define USB_HOST_LCD_DEMO_STRING                "Mass Storage"
#define TCPIP_LCD_DEMO_STRING                   "Webserver"

#define CREDITS_SCR1_LINE_1                     "  Developed By  "
#define CREDITS_SCR1_LINE_2                     ""
#define CREDITS_SCR2_LINE_1                     "F.Ficili &"
#define CREDITS_SCR2_LINE_2                     "V.Germano"
#define CREDITS_SCR3_LINE_1                     "For Futura Group"
#define CREDITS_SCR3_LINE_2                     "futurashop.it"

#define SCR_TRANSITION_DELAY_MS                 ((UINT16)(2000)/APP_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)

#define BACKLIGHT_DELAY_MS                      ((UINT16)(3000)/APP_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)

#define SUB_MENU_NOT_ACTIVE                     ((UINT8)(0))
#define SUB_MENU_ACTIVE                         ((UINT8)(1))

#define CREDITS_OFF                             ((UINT8)(0))
#define CREDITS_ON                              ((UINT8)(1))

/************************************************************************
* Typedef
************************************************************************/
/* App state enum */
typedef enum _AppState
{
    WaitSelection,
    UpdateStatus,
    UpdateDisplay,
} AppStateType;


typedef enum _DemoSelection
{
    NoSelection,
    I2cDemo,
    AdcDemo,
    UartDemo,
    UsbHostDemo,
    TcpIpDemo,
    Credits
} DemoSelectionType;

/* Credits animation type */
typedef enum _CreditsAnimState
{
    Screen1,
    Screen2,
    Screen3,
    Wait,
} CreditsAnimStateType;

/* backlight state */
typedef enum _BacklightState
{
    WaitEvtSt,
    BacklightOnSt,
    BacklightDelaySt,
    BacklightOffSt,
} BacklightStateType;

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Function
************************************************************************/
/* App task */
void AppTask (void);

#endif	/* APP_TASK_H */

