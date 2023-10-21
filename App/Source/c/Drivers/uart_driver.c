/************************************************************************
*                              Uart Driver                              *
*************************************************************************
* FileName:         uart_driver.c                                       *
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
* F.Ficili     16/09/15     1.0          First release                  *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "uart_driver.h"

/************************************************************************
* Global Variables
************************************************************************/
UartConfigType Uart_UartConfig;

/************************************************************************
* Static Variables
************************************************************************/


/************************************************************************
* Local Prototypes
************************************************************************/
void SetUartBaudRate (UINT8 BrgSpeed, UINT32 DesSpeed, UINT32 PeripheralBusClockHz);

/************************************************************************
* LOCAL Functions Implementation
************************************************************************/
/************************************************************************
* Function:     SetUartBaudRate
* Input:        UINT8 BrgSpeed
* Output:       None
* Author:	    F.Ficili
* Description:	Set UART baud rate.
* Date:		04/10/15
************************************************************************/
void SetUartBaudRate (UINT8 BrgSpeed, UINT32 DesSpeed, UINT32 PeripheralBusClockHz)
{
    /* Check BRG speed option */
    if (BrgSpeed == STANDARD_SPEED)
    {
        UART_BRG_REG = ((PeripheralBusClockHz/(16 * DesSpeed)) - 1);
    }
    else
    {
        UART_BRG_REG = ((PeripheralBusClockHz/(4 * DesSpeed)) - 1);
    }
}

/************************************************************************
* GLOBAL Functions Implementation
************************************************************************/
/************************************************************************
* Function:     Uart_SetConfig
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	Set UART configuration.
* Date:		04/10/15
************************************************************************/
void Uart_SetConfig (void)
{
    Uart_UartConfig.UartModuleSts = UART_ENABLED;
    Uart_UartConfig.StopIdle = STOP_IN_IDLE;
    Uart_UartConfig.IrdaEncoder = IRDA_DISABLED;
    Uart_UartConfig.RtsMode = RTS_SIMPLEX;
    Uart_UartConfig.UartMode = ASYNCRONOUS_MODE;
    Uart_UartConfig.WakeUp = WAKE_UP_DISABLED;
    Uart_UartConfig.LoopBack = LOOPBACK_DISABLED;
    Uart_UartConfig.Autobaud = AUTOBAUD_DISABLED;
    Uart_UartConfig.RxPolarity = NORMAL_POLARITY;
    Uart_UartConfig.BrgSpeed = STANDARD_SPEED;
    Uart_UartConfig.ParityBit = NO_PARITY_8_BIT;
    Uart_UartConfig.StopBit = ONE_STOP_BIT;

    Uart_UartConfig.ReceiverEnabled = RECEIVER_ENBALED;
    Uart_UartConfig.TxBreak = TX_BREAK_DISABLED;
    Uart_UartConfig.TransEnabled = TRANSMITTER_ENBALED;
    Uart_UartConfig.PeripheralBusClockHz = PERIPHERAL_FREQUENCY_VALUE_HZ;
}

/************************************************************************
* Function:     Uart_InitUartModule
* Input:        UartConfigType *UartConfig
* Output:       None
* Author:	    F.Ficili
* Description:	Initialize UART module.
* Date:		04/10/15
************************************************************************/
void Uart_InitUartModule (UartConfigType *UartConfig)
{
    /* UxSTA */
    UART_STATUS_REG = 0x00000000;
    UART_STATUS_REG |= (UartConfig->ReceiverEnabled) << UART_RECEIVER_ENABLED_SHIFT;
    UART_STATUS_REG |= (UartConfig->TxBreak) << UART_TX_BREAK_SHIFT;
    UART_STATUS_REG |= (UartConfig->TransEnabled) << UART_TRANSMITTER_ENABLED_SHIFT;

    /* Baud rate calculation */
    SetUartBaudRate(UartConfig->BrgSpeed,DESIRED_UART_BAUD_RATE,UartConfig->PeripheralBusClockHz);

    /* UxMODE */
    UART_MODE_REG = 0x00000000;
    UART_MODE_REG |= (UartConfig->StopIdle) << UART_STOP_IDLE_SHIFT;
    UART_MODE_REG |= (UartConfig->IrdaEncoder) << UART_IRDA_EN_DEC_SHIFT;
    UART_MODE_REG |= (UartConfig->RtsMode) << UART_RTS_MODE_SHIFT;
    UART_MODE_REG |= (UartConfig->UartMode) << UART_ENABLED_SHIFT;
    UART_MODE_REG |= (UartConfig->WakeUp) << UART_WAKE_UP_SHIFT;
    UART_MODE_REG |= (UartConfig->LoopBack) << UART_LOOPBACK_SHIFT;
    UART_MODE_REG |= (UartConfig->Autobaud) << UART_AUTOBAUD_SHIFT;
    UART_MODE_REG |= (UartConfig->RxPolarity) << UART_RX_POLARITY_SHIFT;
    UART_MODE_REG |= (UartConfig->BrgSpeed) << UART_BRG_SPEED_SHIFT;
    UART_MODE_REG |= (UartConfig->ParityBit) << UART_PARITY_SHIFT;
    UART_MODE_REG |= (UartConfig->StopBit) << UART_STOP_BIT_SHIFT;

    /* Enable module */
    UART_MODE_REG |= (UartConfig->UartModuleSts) << UART_MOD_ON_SHIFT;
}

/************************************************************************
* Function:     Uart_WriteByte
* Input:        UINT8 ByteToWrite
* Output:       None
* Author:	    F.Ficili
* Description:	Write one byte.
* Date:		04/10/15
************************************************************************/
void Uart_WriteByte (UINT8 ByteToWrite)
{
    /* Write byte to write on tx buffer */
    UART_TX_BUFFER = ByteToWrite;
}

/************************************************************************
* Function:     Uart_WriteByte
* Input:        None
* Output:       UINT8
* Author:	    F.Ficili
* Description:	Read one byte.
* Date:		04/10/15
************************************************************************/
UINT8 Uart_ReadByte (void)
{
    /* Return content of rx buffer */
    return UART_RX_BUFFER;
}

/************************************************************************
* Function:     Uart_TxBufferStatus
* Input:        None
* Output:       TxBufferStatusType
* Author:	    F.Ficili
* Description:	Check the status of tx buffer (full, not full, empty).
* Date:		05/10/15
************************************************************************/
TxBufferStatusType Uart_TxBufferStatus (void)
{
    TxBufferStatusType TxBufferStatus = TxBufferNotFull;

    /* Check TX buffer status */
    if (((UART_STATUS_REG >> UART_TX_BUFFER_FULL_SHIFT) & K_BIT_0_MASK) == TX_BUFFER_IS_FULL)
    {
        TxBufferStatus = TxBufferFull;
    }
    else if (((UART_STATUS_REG >> UART_TX_SHIFT_REG_EMPTY_SHIFT) & K_BIT_0_MASK) == TX_SHIFT_REG_IS_EMPTY)
    {
        TxBufferStatus = TxBufferEmpty;
    }
    else
    {
        /* Do nothing */
    }

    return TxBufferStatus;
}

/************************************************************************
* Function:     Uart_RxBufferStatus
* Input:        None
* Output:       RxBufferStatusType
* Author:	    F.Ficili
* Description:	Check the status of rx buffer (full, not full, empty).
* Date:		05/10/15
************************************************************************/
RxBufferStatusType Uart_RxBufferStatus (void)
{
    RxBufferStatusType RxBufferStatus = RxBufferNotFull;

    /* Check TX buffer status */
    if (((UART_STATUS_REG & UART_RX_IDLE_SHIFT) >> K_BIT_0_MASK) == RX_IDLE)
    {
        RxBufferStatus = RxBufferIdle;
    }
    else if (((UART_STATUS_REG & UART_RX_BUFFER_STATUS_SHIFT) >> K_BIT_0_MASK) == NO_DATA_IN_RX_BUFFER)
    {
        RxBufferStatus = RxBufferNoData;
    }
    else
    {
        /* Do nothing */
    }

    return RxBufferStatus;
}

/************************************************************************
* Function:     Uart_WriteConstString
* Input:        const UINT8 *ConstStringToWrite
* Output:       None
* Author:	    F.Ficili
* Description:	Write a constant string of bytes.
* Date:		04/10/15
************************************************************************/
void Uart_WriteConstString (const UINT8 *ConstStringToWrite)
{
    /* If the buffer is not empty */
    while (*ConstStringToWrite)
    {
        /* Write current character */
        Uart_WriteByte(*ConstStringToWrite);
        /* Increment pointer */
        ConstStringToWrite++;
        /* If tx buffer is full wait (blocking) */
        while (Uart_TxBufferStatus() == TxBufferFull);
    }
}

/************************************************************************
* Function:     Uart_WriteString
* Input:        UINT8 *StringToWrite
* Output:       None
* Author:	    F.Ficili
* Description:	Write a string of bytes.
* Date:		05/10/15
************************************************************************/
void Uart_WriteString (UINT8 *StringToWrite)
{
    /* If the buffer is not empty */
    while (*StringToWrite)
    {
        /* Write current character */
        Uart_WriteByte(*StringToWrite);
        /* Increment pointer */
        StringToWrite++;
        /* If tx buffer is full wait (blocking) */
        while (Uart_TxBufferStatus() == TxBufferFull);
    }
}




