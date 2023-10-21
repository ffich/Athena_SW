
/************************************************************************
*                               App Task                                *
*************************************************************************
* FileName:         app_task.c                                          *
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
* F.Ficili     16/09/15    1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "app_task.h"

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Static Variables
************************************************************************/
/* Credits animation Activation/deactivation  */
static UINT8 CreditsStatus = CREDITS_OFF;
static EventStructureType ActivateBacklight = {NO_MASK, EventIdle};

/************************************************************************
* Local Prototypes
************************************************************************/
void AppInit (void);
void AppWelcome (void);
void CreditsAnimation (void);
void BacklightControl (void);
void AppMainTask (void);
void DisplayUpdate (DemoSelectionType Selection);
void TaskActivation (DemoSelectionType Selection);
void TaskDeactivation (DemoSelectionType Selection);

/************************************************************************
* Function Implementations
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     AppTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Main application task.
* Date:		16/09/15
************************************************************************/
void AppTask (void)
{    
    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Init all app processes and variables */
            AppInit();
            break;

        /* System Normal operaion Phase */
        case RunningState:
            /* Application main task */
            AppMainTask();
            /* Credits animation */
            CreditsAnimation();
            /* Control LCD backlight */
            BacklightControl();
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* Function:     AppInit
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Init application variables.
* Date:		30/09/15
************************************************************************/
void AppInit (void)
{
    /* Init joystick */
    Joystick_InitJoystick();
    /* Init LCD */
    Lcd_SetConfig();
    Lcd_InitLcdInterface();

    /* Deactivate all tasks */
    GenerateEvt(&DeactivateMcp23008Task);
    GenerateEvt(&DeactivateUsbTask);
    GenerateEvt(&DeactivateTcpIpTask);
    GenerateEvt(&DeactivateAdcTask);
    GenerateEvt(&DeactivateComTask);

    /* Write splash screen */
    AppWelcome();
}

/************************************************************************
* Function:     AppWelcome
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Welcome splash screen.
* Date:		30/09/15
************************************************************************/
void AppWelcome (void)
{
    /* Backlight */
    GenerateEvt(&ActivateBacklight);
    /* Clear LCD display */
    Lcd_WriteCommand(CLEAR_DISPLAY);
    /* Move to line 1 */
    Lcd_WriteCommand(CURSOR_HOME);
    Lcd_WriteConstString("DemoBoard PIC32");
    /* Move to line 2 */
    Lcd_WriteCommand(CURSOR_LINE_2);
    Lcd_WriteConstString("    Demo App   ");
}

/************************************************************************
* Function:     AppMainTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Main application task.
* Date:		30/09/15
************************************************************************/
void AppMainTask (void)
{
    static AppStateType AppState = WaitSelection;
    static JoystickStateType JoystickStatus = JoystickNone;
    static DemoSelectionType DemoSelection = NoSelection;
    static UINT8 SubMenuActiveSts = SUB_MENU_NOT_ACTIVE;

    switch (AppState)
    {
        case WaitSelection:
            /* Get joystick status */
            if (Joystick_GetJoystickState() != JoystickNone)
            {
                /* Store joystick value */
                JoystickStatus = Joystick_GetJoystickState();
                /* Jump to UpdateStatus*/
                AppState = UpdateStatus;
            }
            break;

        case UpdateStatus:
            /* Update demo status */
            if ((JoystickStatus == JoystickDown) && (SubMenuActiveSts == SUB_MENU_NOT_ACTIVE))
            {
                /* Backlight */
                GenerateEvt(&ActivateBacklight);
                /* Check selection */
                if (DemoSelection < Credits)
                {
                    DemoSelection++;
                    /* Jump to UpdateDisplay*/
                    AppState = UpdateDisplay;
                }
                else
                {
                    /* Jump to WaitSelection*/
                    AppState = WaitSelection;
                }
            }
            else if ((JoystickStatus == JoystickUp) && (SubMenuActiveSts == SUB_MENU_NOT_ACTIVE))
            {
                /* Backlight */
                GenerateEvt(&ActivateBacklight);
                /* Check selection */
                if (DemoSelection > NoSelection)
                {
                    DemoSelection--;
                    /* Jump to UpdateDisplay*/
                    AppState = UpdateDisplay;
                }
                else
                {
                    /* Jump to WaitSelection*/
                    AppState = WaitSelection;
                }
            }
            else if  ((JoystickStatus == JoystickRight) && (SubMenuActiveSts == SUB_MENU_NOT_ACTIVE) && (DemoSelection != NoSelection))
            {
                /* Backlight */
                GenerateEvt(&ActivateBacklight);
                /* Selection active */
                SubMenuActiveSts = SUB_MENU_ACTIVE; 
                /* Set active Selection */
                TaskActivation(DemoSelection);
                /* Jump to WaitSelection*/
                AppState = WaitSelection;
            }
            else if  ((JoystickStatus == JoystickLeft) && (SubMenuActiveSts == SUB_MENU_ACTIVE))
            {
                /* Backlight */
                GenerateEvt(&ActivateBacklight);
                /* Selection acrtive */
                SubMenuActiveSts = SUB_MENU_NOT_ACTIVE;                
                /* Return to main menu */
                TaskDeactivation(DemoSelection);
                /* Jump to UpdateDisplay*/
                AppState = UpdateDisplay;
            }
            else
            {
                /* No valid selection */
                AppState = WaitSelection;
            }
            break;

        case UpdateDisplay:
            /* Update display */
            DisplayUpdate(DemoSelection);
            /* Jump to WaitSelection*/
            AppState = WaitSelection;
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     TaskActivation
* Input:        DemoSelectionType Selection
* Output:       None
* Author:	F.Ficili
* Description:	Activate selected task.
* Date:		30/09/15
************************************************************************/
void TaskActivation (DemoSelectionType Selection)
{
    /* Select the correct string */
    switch (Selection)
    {
        case NoSelection:
            /* No selection */
            break;

        case I2cDemo:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString(I2C_LCD_DEMO_STRING);
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Send activation event */
            GenerateEvt(&ActivateMcp23008Task);
            break;

        case AdcDemo:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString(ADC_LCD_DEMO_STRING);
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Send activation event */
            GenerateEvt(&ActivateAdcTask);
            break;

        case UartDemo:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString(UART_LCD_DEMO_STRING);
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Send activation event */
            GenerateEvt(&ActivateComTask);
            break;

        case UsbHostDemo:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString(USB_HOST_LCD_DEMO_STRING);
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Send activation event */
            GenerateEvt(&ActivateUsbTask);
            break;

        case TcpIpDemo:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString(TCPIP_LCD_DEMO_STRING);
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Send activation event */
            GenerateEvt(&ActivateTcpIpTask);
            break;

        case Credits:
            /* Activate Credits */
            CreditsStatus = CREDITS_ON;
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     TaskDeactivation
* Input:        DemoSelectionType Selection
* Output:       None
* Author:	F.Ficili
* Description:	Deactivate selected task.
* Date:		30/09/15
************************************************************************/
void TaskDeactivation (DemoSelectionType Selection)
{
    /* Select the correct string */
    switch (Selection)
    {
        case NoSelection:
            /* No selection */
            break;

        case I2cDemo:
            /* Send deactivation event */
            GenerateEvt(&DeactivateMcp23008Task);
            break;

        case AdcDemo:
            /* Send deactivation event */
            GenerateEvt(&DeactivateAdcTask);
            break;

        case UartDemo:
            /* Send deactivation event */
            GenerateEvt(&DeactivateComTask);
            break;

        case UsbHostDemo:
            /* Send deactivation event */
            GenerateEvt(&DeactivateUsbTask);
            break;

        case TcpIpDemo:
            /* Send deactivation event */
            GenerateEvt(&DeactivateTcpIpTask);
            break;

        case Credits:
            /* Deactivate Credits */
            CreditsStatus = CREDITS_OFF;
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     DisplayUpdate
* Input:        DemoSelectionType Selection
* Output:       None
* Author:	F.Ficili
* Description:	Update board display.
* Date:		30/09/15
************************************************************************/
void DisplayUpdate (DemoSelectionType Selection)
{
    /* Clear LCD display */
    Lcd_WriteCommand(CLEAR_DISPLAY);
    Lcd_WriteCommand(CURSOR_HOME);

    /* Select the correct string */
    switch (Selection)
    {
        case NoSelection:
            /* No selection */
            Lcd_WriteConstString(NO_SELECTION);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(UP_DOWN_INDICATION);
            break;

        case I2cDemo:
            /* Write selection */
            Lcd_WriteConstString(I2C_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        case AdcDemo:
            /* Write selection */
            Lcd_WriteConstString(ADC_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        case UartDemo:
            /* Write selection */
            Lcd_WriteConstString(UART_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        case UsbHostDemo:
            /* Write selection */
            Lcd_WriteConstString(USB_HOST_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        case TcpIpDemo:
            /* Write selection */
            Lcd_WriteConstString(TCPIP_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        case Credits:
            /* Write selection */
            Lcd_WriteConstString(CREDITS_LCD_STRING);
            /* Write second line */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(SELECTION_INDICATION);
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     CreditsAnimation
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Present Credits animation display.
* Date:		25/10/15
************************************************************************/
void CreditsAnimation (void)
{
    static CreditsAnimStateType CreditsAnimState = Screen1;
    static CreditsAnimStateType NextState;
    static UINT16 Counter = 0;

    if (CreditsStatus == CREDITS_ON)
    {
        switch (CreditsAnimState)
        {
            case Screen1:
                /* Clear LCD display */
                Lcd_WriteCommand(CLEAR_DISPLAY);
                Lcd_WriteCommand(CURSOR_HOME);
                /* Screen 1 */
                Lcd_WriteConstString(CREDITS_SCR1_LINE_1);
                Lcd_WriteCommand(CURSOR_LINE_2);
                Lcd_WriteConstString(CREDITS_SCR1_LINE_2);
                /* Store states */
                CreditsAnimState = Wait;
                NextState = Screen2;
                break;

            case Screen2:
                /* Clear LCD display */
                Lcd_WriteCommand(CLEAR_DISPLAY);
                Lcd_WriteCommand(CURSOR_HOME);
                /* Screen 2 */
                Lcd_WriteConstString(CREDITS_SCR2_LINE_1);
                Lcd_WriteCommand(CURSOR_LINE_2);
                Lcd_WriteConstString(CREDITS_SCR2_LINE_2);
                /* Store states */
                CreditsAnimState = Wait;
                NextState = Screen3;
                break;

            case Screen3:
                /* Clear LCD display */
                Lcd_WriteCommand(CLEAR_DISPLAY);
                Lcd_WriteCommand(CURSOR_HOME);
                /* Screen 2 */
                Lcd_WriteConstString(CREDITS_SCR3_LINE_1);
                Lcd_WriteCommand(CURSOR_LINE_2);
                Lcd_WriteConstString(CREDITS_SCR3_LINE_2);
                /* Store states */
                CreditsAnimState = Wait;
                NextState = Screen1;
                break;

            case Wait:
                /* Inc. counter */
                Counter++;
                /* Check counter */
                if (Counter >= SCR_TRANSITION_DELAY_MS)
                {
                    /* Reset counter */
                    Counter = 0;
                    /* Switch state */
                    CreditsAnimState = NextState;
                }
                break;

            default:
                break;
        }
    }
}

/************************************************************************
* Function:     BacklightControl
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Control LCD backlight.
* Date:		25/10/15
************************************************************************/
void BacklightControl (void)
{
    static BacklightStateType BacklightState = WaitEvtSt;
    static UINT16 Counter = 0;

    switch (BacklightState)
    {
        case WaitEvtSt:
            /* If evt received */
            if (ReceiveEvt(&ActivateBacklight))
            {
                /* Switch state */
                BacklightState = BacklightOn;
            }
            break;

        case BacklightOn:
            /* Backlight on */
            Lcd_Backlight(BacklightOn);
            /* Reset counter */
            Counter = 0;            
            /* Switch state */
            BacklightState = BacklightDelaySt;
            break;

        case BacklightDelaySt:
            /* Inc counter */
            Counter++;
            /* If evt received */
            if (ReceiveEvt(&ActivateBacklight))
            {
                /* Switch state */
                BacklightState = BacklightOn;
            }            
            else if (Counter >= BACKLIGHT_DELAY_MS) /* Check counter */
            {
                /* Switch state */
                BacklightState = BacklightOffSt;
            }
            else
            {
               /* Do nothing, satisfy MISRA */
            }
            break;

        case BacklightOffSt:
            /* Backlight on */
            Lcd_Backlight(BacklightOff);
            /* Switch state */
            BacklightState = WaitEvtSt;
            break;

        default:
            break;
    }
}