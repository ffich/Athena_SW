
/************************************************************************
*                               Test Task                               *
*************************************************************************
* FileName:         test_task.c                                         *
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
* F.Ficili     13/09/15    1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "test_task.h"
#include "i2c_driver.h"
#include "lcd_driver.h"
#include "adc_driver.h"
#include "uart_driver.h"
#include "joystick_driver.h"

/************************************************************************
* Defines
************************************************************************/
//#define ADC_TEST
//#define LCD_TEST
//#define I2C_TEST
//#define UART_TEST

/************************************************************************
* Global Variables
************************************************************************/
UINT8 ADC_AdcResPerc = 0;

/************************************************************************
* Static Variables
************************************************************************/


/************************************************************************
* Local Prototypes
************************************************************************/
void I2cTest (void);
void LcdTest (void);
void AdcTest (void);
void UartTest (void);

/************************************************************************
* Function Implementations
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     TestTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Used to check components.
* Date:		13/09/15
************************************************************************/
void TestTask (void)
{    
    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:

#ifdef LCD_TEST
            Lcd_SetConfig();
            Lcd_InitLcdInterface();
#endif

#ifdef I2C_TEST
            I2c_SetConfig();
            I2c_InitI2cModule();
#endif
      
#ifdef ADC_TEST
            Joystick_InitJoystick();
            Adc_SetConfig();
            Adc_InitAdcModule(&Adc_AdcConfig);
            Adc_SetInputConfig(&Adc_InputConfig);
            Adc_SetPortConfig(&Adc_PortConfig);
            Adc_AutoScanConfig(&Adc_AutoscanConfig);
#endif

#ifdef UART_TEST
            Uart_SetConfig();
            Uart_InitUartModule(&Uart_UartConfig);
#endif

            break;

        /* System Normal operaion Phase */
        case RunningState:

#ifdef LCD_TEST
            //LcdTest();
#endif

#ifdef I2C_TEST
            I2cTest();
#endif

#ifdef ADC_TEST
            AdcTest();
#endif

#ifdef UART_TEST
            UartTest();
#endif
            
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* Function:     I2cTest
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Test i2c driver.
* Date:		13/09/15
************************************************************************/
void I2cTest (void)
{
#ifdef I2C_TEST
    /* States */
    #define PREPARE_BUFFER_1 0
    #define SET_MCP23008_DIRECTION_REG 1
    #define PREPARE_BUFFER_2 2
    #define SET_MCP23008_IO_LINE 3
    #define STOP 4
    #define ERROR 5

    static UINT8 TestState = PREPARE_BUFFER_1;
    static UINT8 Buffer[2];
    static I2cWritePacketType I2cPacket;
    
    switch (TestState)
    {
        case PREPARE_BUFFER_1:
            /* Payload */
            Buffer[0] = 0x00;
            Buffer[1] = 0x00;

            I2cPacket.SlaveAddress = 0x40;
            I2cPacket.ReadWrite = 0; /* Write op */
            I2cPacket.Lenght = 2;
            I2cPacket.Buffer = Buffer;

            TestState = SET_MCP23008_DIRECTION_REG;
            break;

        case SET_MCP23008_DIRECTION_REG:
            /* Write on i2c bus */
            if ((I2c_WriteData(&I2cPacket)) != I2cWriteInProgress)
            {
                TestState = PREPARE_BUFFER_2;
            }         
            break;

        case PREPARE_BUFFER_2:
            /* Payload */
            Buffer[0] = 0x09;
            Buffer[1] = 0b01010101;

            I2cPacket.SlaveAddress = 0x40;
            I2cPacket.ReadWrite = 0; /* Write op */
            I2cPacket.Lenght = 2;
            I2cPacket.Buffer = Buffer;

            TestState = SET_MCP23008_IO_LINE;
            break;

        case SET_MCP23008_IO_LINE:
            /* Write on i2c bus */
            if ((I2c_WriteData(&I2cPacket)) != I2cWriteInProgress)
            {
                TestState = STOP;
            }
            break;

        case STOP:
            break;
            
        case ERROR:
            break;            

        default:
            break;
    }
#endif
}

/************************************************************************
* Function:     LcdTest
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Test LCD driver.
* Date:		13/09/15
************************************************************************/
void LcdTest (void)
{
#ifdef LCD_TEST
    /* States */
    #define LCD_MSG_1 0
    #define LCD_MSG_2 1
    #define LCD_STOP 2
    #define LCD_ERROR 3

    static UINT8 TestState = LCD_MSG_1;

    switch (TestState)
    {
        case LCD_MSG_1:
            /* Welcolme */
            Lcd_WriteString("Hello World!!!");
            Lcd_WriteCommand(0xC0);
            TestState = LCD_MSG_2;
            break;

        case LCD_MSG_2:
            /* Credits */
            Lcd_WriteString("Ficili&Germano");
            TestState = LCD_STOP;
            break;

        case LCD_STOP:
            break;

        case LCD_ERROR:
            break;

        default:
            break;
    }
#endif
}

/************************************************************************
* Function:     AdcTest
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Test ADC driver.
* Date:		22/09/15
************************************************************************/
void AdcTest (void)
{
    /* States */
    #define ADC_START_SAMP          0
    #define ADC_START_CONV          1
    #define ADC_CHECK_SAMP_COMP     2
    #define ADC_GET_RES             3

    static UINT8 TestState = ADC_START_SAMP;
    static UINT32 AdcResult;
    static UINT8 AdcResultPerc;
    static UINT8 LcdStr[4];


    switch (TestState)
    {
        case ADC_START_SAMP:
            Adc_SampleData();
            TestState = ADC_START_CONV;
            break;

        case ADC_START_CONV:
            Adc_ConvertData();
            TestState = ADC_CHECK_SAMP_COMP;
            break;

        case ADC_CHECK_SAMP_COMP:
            if (Adc_IsConvComplete())
            {
                TestState = ADC_GET_RES;                                
            }
            else
            {
                TestState = ADC_CHECK_SAMP_COMP;
            }

            break;

        case ADC_GET_RES:
            Lcd_WriteCommand(CLEAR_DISPLAY);
            AdcResult = Adc_GetConvResultRaw();
            AdcResultPerc = Adc_GetConvResultPerc();
            ADC_AdcResPerc = AdcResultPerc;

            if (Joystick_GetJoystickState() == JoystickUp)
            {
                ltoa(LcdStr,AdcResultPerc,10);
                Lcd_WriteCommand(CURSOR_HOME);
                Lcd_WriteString(LcdStr);
                Lcd_WriteChar('%');
            }
            else
            {
                itoa(LcdStr,AdcResult,10);
                Lcd_WriteCommand(CURSOR_HOME);
                Lcd_WriteString(LcdStr);
            }


            TestState = ADC_START_SAMP;
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     UartTest
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Test UART driver.
* Date:		04/10/15
************************************************************************/
void UartTest (void)
{
    /* States */
    #define UART_DELAY              0
    #define UART_SEND_DATA          1

    static UINT8 TestState = UART_DELAY;
    static UINT32 UartCnt = 0;

    switch (TestState)
    {
        case UART_DELAY:
            UartCnt++;

            if (UartCnt > 10)
            {
                UartCnt = 0;
                TestState = UART_SEND_DATA;
            }
            break;

        case UART_SEND_DATA:
            Uart_WriteConstString("Hello world UART!!!");
            TestState = UART_DELAY;
            break;

        default:
            break;
    }
}



