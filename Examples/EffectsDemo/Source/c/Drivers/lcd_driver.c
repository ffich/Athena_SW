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
* F.Ficili     06/09/15     1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "lcd_driver.h"

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Static Variables
************************************************************************/
static LcdConfigType LcdConfig;

/************************************************************************
* Local Prototypes
************************************************************************/
void Lcd_InitHwInterface(void);
void LcdDelay (UINT16 Delay);
void SendEnabPulse (void);

/************************************************************************
* LOCAL Functions Implementation
************************************************************************/

/************************************************************************
* Function:     LcdDelay
* Input:        UINT16 Delay
* Output:       None
* Author:	F.Ficili
* Description:	Delay function for enable pulse.
* Date:		06/09/15
************************************************************************/
void LcdDelay (UINT16 Delay)
{
    /* Service counter */
    UINT16 SerCnt;

    /* Generate sw delay */
    for (SerCnt = 0; SerCnt < Delay; SerCnt++)
    {
        asm("NOP");
        asm("NOP");
        asm("NOP");
        asm("NOP");
    }
}

/************************************************************************
* Function:     Lcd_InitHwInterface
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initialize HW interface.
* Date:		06/09/15
************************************************************************/
void Lcd_InitHwInterface(void)
{
    /* Initialize data line tris registers */
    LCD_D0_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D1_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D2_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D3_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D4_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D5_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D6_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_D7_TRIS = LINE_DIRECTION_OUTPUT;

    /* Initialize command line tris registers*/
    LCD_EN_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_RS_TRIS = LINE_DIRECTION_OUTPUT;
    LCD_RW_TRIS = LINE_DIRECTION_OUTPUT;

    /* Initialize backlight tris register */
    LCD_BKL_TRIS = LINE_DIRECTION_OUTPUT;

    /* Initialize data lines */
    LCD_D0 = LINE_STATE_LOW;
    LCD_D1 = LINE_STATE_LOW;
    LCD_D2 = LINE_STATE_LOW;
    LCD_D3 = LINE_STATE_LOW;
    LCD_D4 = LINE_STATE_LOW;
    LCD_D5 = LINE_STATE_LOW;
    LCD_D6 = LINE_STATE_LOW;
    LCD_D7 = LINE_STATE_LOW;

    /* Initialize command lines */
    LCD_EN = LINE_STATE_LOW;
    LCD_RS = LINE_STATE_LOW;
    LCD_RW = LINE_STATE_LOW;
    LCD_BKL = LINE_STATE_LOW;
}

/************************************************************************
* Function:     SendEnabPulse
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Generates the enable pulse.
* Date:		06/09/15
************************************************************************/
void SendEnabPulse (void)
{
    /* Set Enable pin */
    LCD_EN = LINE_STATE_HIGH;
    /* Delay */
    LcdDelay(ENABLE_PULSE_DELAY_1);
    /* Clear Enable pin */
    LCD_EN = LINE_STATE_LOW;
    /* Delay */
    LcdDelay(ENABLE_PULSE_DELAY_2);
}

/************************************************************************
* GLOBAL Functions Implementation
************************************************************************/

/************************************************************************
* Function:     Lcd_WriteCommand
* Input:        UINT8 CommandToWrite
* Output:       None
* Author:	F.Ficili
* Description:	Write a command to LCD.
* Date:		06/09/15
************************************************************************/
void Lcd_WriteCommand (UINT8 CommandToWrite)
{
    /* Access command register, write mode */
    LCD_RS = LINE_STATE_LOW;

    if (LcdConfig.FsIntType == FS_DL_INT_8_BIT)
    {
        /* Set data line - Byte mode */
        LCD_D7 = ((CommandToWrite & BIT_7_MASK) >> BITWISE_SHIFT_7);
        LCD_D6 = ((CommandToWrite & BIT_6_MASK) >> BITWISE_SHIFT_6);
        LCD_D5 = ((CommandToWrite & BIT_5_MASK) >> BITWISE_SHIFT_5);
        LCD_D4 = ((CommandToWrite & BIT_4_MASK) >> BITWISE_SHIFT_4);
        LCD_D3 = ((CommandToWrite & BIT_3_MASK) >> BITWISE_SHIFT_3);
        LCD_D2 = ((CommandToWrite & BIT_2_MASK) >> BITWISE_SHIFT_2);
        LCD_D1 = ((CommandToWrite & BIT_1_MASK) >> BITWISE_SHIFT_1);
        LCD_D0 = ((CommandToWrite & BIT_0_MASK));

        /* Enable pulse */
        SendEnabPulse();
    }
    else
    {
        /* Set data line - Nibble mode */
        LCD_D7 = ((CommandToWrite & BIT_7_MASK) >> BITWISE_SHIFT_7);
        LCD_D6 = ((CommandToWrite & BIT_6_MASK) >> BITWISE_SHIFT_6);
        LCD_D5 = ((CommandToWrite & BIT_5_MASK) >> BITWISE_SHIFT_5);
        LCD_D4 = ((CommandToWrite & BIT_4_MASK) >> BITWISE_SHIFT_4);

        /* Enable pulse */
        SendEnabPulse();

        LCD_D7 = ((CommandToWrite & BIT_3_MASK) >> BITWISE_SHIFT_3);
        LCD_D6 = ((CommandToWrite & BIT_2_MASK) >> BITWISE_SHIFT_2);
        LCD_D5 = ((CommandToWrite & BIT_1_MASK) >> BITWISE_SHIFT_1);
        LCD_D4 = ((CommandToWrite & BIT_0_MASK));

        /* Enable pulse */
        SendEnabPulse();
    }
}

/************************************************************************
* Function:     Lcd_WriteChar
* Input:        UINT8 CharToWrite
* Output:       None
* Author:	F.Ficili
* Description:	Write a character to LCD.
* Date:		06/09/15
************************************************************************/
void Lcd_WriteChar (UINT8 CharToWrite)
{
    /* Access data register, write mode */
    LCD_RS = LINE_STATE_HIGH;

    if (LcdConfig.FsIntType == FS_DL_INT_8_BIT)
    {
        /* Set data line - Byte mode */
        LCD_D7 = ((CharToWrite & BIT_7_MASK) >> BITWISE_SHIFT_7);
        LCD_D6 = ((CharToWrite & BIT_6_MASK) >> BITWISE_SHIFT_6);
        LCD_D5 = ((CharToWrite & BIT_5_MASK) >> BITWISE_SHIFT_5);
        LCD_D4 = ((CharToWrite & BIT_4_MASK) >> BITWISE_SHIFT_4);
        LCD_D3 = ((CharToWrite & BIT_3_MASK) >> BITWISE_SHIFT_3);
        LCD_D2 = ((CharToWrite & BIT_2_MASK) >> BITWISE_SHIFT_2);
        LCD_D1 = ((CharToWrite & BIT_1_MASK) >> BITWISE_SHIFT_1);
        LCD_D0 = ((CharToWrite & BIT_0_MASK));

        /* Enable pulse */
        SendEnabPulse();
    }
    else
    {
        /* Set data line - Nibble mode */
        LCD_D7 = ((CharToWrite & BIT_7_MASK) >> BITWISE_SHIFT_7);
        LCD_D6 = ((CharToWrite & BIT_6_MASK) >> BITWISE_SHIFT_6);
        LCD_D5 = ((CharToWrite & BIT_5_MASK) >> BITWISE_SHIFT_5);
        LCD_D4 = ((CharToWrite & BIT_4_MASK) >> BITWISE_SHIFT_4);

        /* Enable pulse */
        SendEnabPulse();

        LCD_D7 = ((CharToWrite & BIT_3_MASK) >> BITWISE_SHIFT_3);
        LCD_D6 = ((CharToWrite & BIT_2_MASK) >> BITWISE_SHIFT_2);
        LCD_D5 = ((CharToWrite & BIT_1_MASK) >> BITWISE_SHIFT_1);
        LCD_D4 = ((CharToWrite & BIT_0_MASK));

        /* Enable pulse */
        SendEnabPulse();
    }

    /* Clear data line */
    LCD_RS = LINE_STATE_LOW;
}

/************************************************************************
* Function:     Lcd_WriteConstString
* Input:        UINT8 const ConstString
* Output:       None
* Author:	F.Ficili
* Description:	Write a const string to LCD.
* Date:		06/09/15
************************************************************************/
void Lcd_WriteConstString (const UINT8 *ConstString)
{
    /* Until ConstString != NULL */
    while (*ConstString)
    {
        /* Write current character */
        Lcd_WriteChar(*ConstString);
        /* Increment pointer */
        ConstString++;
    }
}

/************************************************************************
* Function:     Lcd_WriteString
* Input:        UINT8 VarString
* Output:       None
* Author:	F.Ficili
* Description:	Write a string to LCD.
* Date:		06/09/15
************************************************************************/
void Lcd_WriteString (UINT8 *VarString)
{
    /* Until VarString != NULL */
    while (*VarString)
    {
        /* Write current character */
        Lcd_WriteChar(*VarString);
        /* Increment pointer */
        VarString++;
    }
}

/************************************************************************
* Function:     Lcd_InitLcdInterface
* Input:        LcdConfigType *LcdConfig
* Output:       LcdInitStateType
* Author:	F.Ficili
* Description:	Initialize LCD display. To correctly initialize you need to first
*               call Lcd_SetConfig funcgtion.
* Date:		06/09/15
************************************************************************/
LcdInitStateType Lcd_InitLcdInterface (void)
{
    static LcdInitStateType LcdInitState = InitDelayState;
    static LcdInitStateType LcdNextState = InitDelayState;
    static UINT16 LcdInitCounter = 0;

    /* Loop until init is complete */
    while (LcdInitState != InitCompleteState)
    {
        switch (LcdInitState)
        {
            case InitDelayState:
                /* Init delay */
                LcdDelay(INIT_DELAY);
                /* Jump to InitHwIntState */
                LcdInitState = InitHwIntState;
                break;

            case InitHwIntState:
                /* Init hw interface */
                Lcd_InitHwInterface();
                /* Jump to FunctionSetState */
                LcdInitState = FunctionSetState;
                break;

            case FunctionSetState:
                /* Increment counter */
                LcdInitCounter++;
                /* Function set */
                Lcd_WriteCommand(FUNCTION_SET_CMD | (LcdConfig.FsIntType << FS_DL_SHIFT) |
                                                    (LcdConfig.FsLineNumb << FS_N_SHIFT) |
                                                    (LcdConfig.FsFontType << FS_F_SHIFT));
                /* Check counter */
                if (LcdInitCounter >= INIT_FS_TIME)
                {
                    /* Reset */
                    LcdInitCounter = 0;
                    /* Store next state */
                    LcdNextState = DisplayControlState;
                    /* Jump to LcdWaitState */
                    LcdInitState = LcdWaitState;
                }
                else
                {
                    /* Store next state */
                    LcdNextState = FunctionSetState;
                    /* Jump to LcdWaitState */
                    LcdInitState = LcdWaitState;
                }
                break;

            case DisplayControlState:
                /* Display control */
                Lcd_WriteCommand(DISPLAY_CONTROL_CMD | (LcdConfig.DcDisplayOnOff << DC_D_SHIFT) |
                                                       (LcdConfig.DcCursorOnOff << DC_C_SHIFT) |
                                                       (LcdConfig.DcBlinkOnOff << DC_B_SHIFT));
                /* Store next state */
                LcdNextState = DisplaySetState;
                /* Jump to LcdWaitState */
                LcdInitState = LcdWaitState;
                break;

            case DisplaySetState:
                /* Display set */
                Lcd_WriteCommand(CURSOR_CONTROL_CMD | (LcdConfig.CcCursorMove << CC_SC_SHIFT) |
                                                      (LcdConfig.CcShiftLeftRight << CC_RL_SHIFT));
                /* Store next state */
                LcdNextState = EntryModeState;
                /* Jump to LcdWaitState */
                LcdInitState = LcdWaitState;
                break;

            case EntryModeState:
                /* Entry mode */
                Lcd_WriteCommand(ENTRY_MODE_CMD | (LcdConfig.EmInitCursorPosIncDec << EM_ID_SHIFT) |
                                                  (LcdConfig.EmDisplayShiftOnOff << EM_S_SHIFT));
                /* Jump to EntryModeState */
                LcdInitState = ClearDisplayState;
                break;

            case ClearDisplayState:
                /* Clear display */
                Lcd_WriteCommand(CLEAR_DISPLAY);
                /* Store next state */
                LcdNextState = InitCompleteState;
                /* Jump to LcdWaitState */
                LcdInitState = LcdWaitState;
                break;

            case LcdWaitState:
                /* Delay state */
                LcdDelay(STATE_DELAY);
                /* Go to previously stored next state */
                LcdInitState = LcdNextState;
                break;

            case InitCompleteState:
                /* Init complete, Do nothing */
                break;

            default:
                break;
        }
    }

    /* Return state */
    return LcdInitState;
}

/************************************************************************
* Function:     Lcd_SetConfig
* Input:        LcdConfigType *LcdConfig
* Output:       None
* Author:	F.Ficili
* Description:	Set the configuration structure for initialization.
* Date:		06/09/15
************************************************************************/
void Lcd_SetConfig (void)
{
    /* Default confioguration in 8 bit mode */
    LcdConfig.EmDisplayShiftOnOff = EM_S_NO_DISPLAY_SHIFT;
    LcdConfig.EmInitCursorPosIncDec = EM_ID_INC_CURSOR_POS;
    LcdConfig.CcCursorMove = CC_SC_SHIFT_DISPLAY;
    LcdConfig.CcShiftLeftRight = CC_RL_SHIFT_RIGHT;
    LcdConfig.DcBlinkOnOff = DC_B_BLINK_OFF;
    LcdConfig.DcCursorOnOff = DC_C_CURSOR_OFF;
    LcdConfig.DcDisplayOnOff = DC_D_DISPLAY_ON;
    LcdConfig.FsLineNumb = FS_N_2_LINE;
    LcdConfig.FsFontType = FS_F_5_X_8_DOTS;
    LcdConfig.FsIntType = FS_DL_INT_8_BIT;
}

/************************************************************************
* Function:     Lcd_Backlight
* Input:        BacklStsType Backlight
* Output:       None
* Author:	F.Ficili
* Description:	Manage the backlight line.
* Date:		06/09/15
************************************************************************/
void Lcd_Backlight(BacklStsType Backlight)
{
    /* Check variable */
    if (Backlight == BacklightOn)
    {
        /* Set backlight ON */
        LCD_BKL = LINE_STATE_HIGH;
    }
    else
    {
        /* Set backlight OFF */
        LCD_BKL = LINE_STATE_LOW;
    }
}


