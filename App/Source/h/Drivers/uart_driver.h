/************************************************************************
*                           Uart Driver                                 *
*************************************************************************
* FileName:         uart_driver.h                                       *
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

#ifndef UART_DRIVER_H
#define	UART_DRIVER_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "GenericTypeDefs.h"
#include "hw_profile.h"
#include "common.h"
#include "system_init.h"

/************************************************************************
* Defines
************************************************************************/
/* Define UART module to use */
//#define UART_MODULE_1                                       ((UINT8)(1))
#define UART_MODULE_2                                       ((UINT8)(2))
//#define UART_MODULE_3                                       ((UINT8)(3))
//#define UART_MODULE_4                                       ((UINT8)(4))

#ifdef UART_MODULE_1
    #define UART_MODE_REG                                   U1MODE
    #define UART_STATUS_REG                                 U1STA
    #define UART_BRG_REG                                    U1BRG
    #define UART_TX_BUFFER                                  U1TXREG
    #define UART_RX_BUFFER                                  U1RXREG
#endif

#ifdef UART_MODULE_2
    #define UART_MODE_REG                                   U2MODE
    #define UART_STATUS_REG                                 U2STA
    #define UART_BRG_REG                                    U2BRG
    #define UART_TX_BUFFER                                  U2TXREG
    #define UART_RX_BUFFER                                  U2RXREG
#endif

#ifdef UART_MODULE_3
    #define UART_MODE_REG                                   U3MODE
    #define UART_STATUS_REG                                 U3STA
    #define UART_BRG_REG                                    U3BRG
    #define UART_TX_BUFFER                                  U3TXREG
    #define UART_RX_BUFFER                                  U3RXREG
#endif

#ifdef UART_MODULE_4
    #define UART_MODE_REG                                   U4MODE
    #define UART_STATUS_REG                                 U4STA
    #define UART_BRG_REG                                    U4BRG
    #define UART_TX_BUFFER                                  U4TXREG
    #define UART_RX_BUFFER                                  U4RXREG
#endif

/* Baud Rate generator parameters */
#define DESIRED_UART_BAUD_RATE                              ((UINT32)(9600))

/* UxMODE */
#define UART_MOD_ON_SHIFT                               ((UINT8)(15))
#define UART_DISABLED                                   ((UINT8)(0))
#define UART_ENABLED                                    ((UINT8)(1))

#define UART_STOP_IDLE_SHIFT                            ((UINT8)(13))
#define STOP_IN_IDLE                                    ((UINT8)(0))
#define ACTIVE_IN_IDLE                                  ((UINT8)(1))

#define UART_IRDA_EN_DEC_SHIFT                          ((UINT8)(12))
#define IRDA_DISABLED                                   ((UINT8)(0))
#define IRDA_ENABLED                                    ((UINT8)(1))

#define UART_RTS_MODE_SHIFT                             ((UINT8)(11))
#define RTS_SIMPLEX                                     ((UINT8)(0))
#define RTS_FLOW_CONTROL                                ((UINT8)(1))

#define UART_ENABLED_SHIFT                              ((UINT8)(8))
#define SYNCRONOUS_UART_MODE                            ((UINT8)(0b11))
#define FLOW_CONTROL_MODE                               ((UINT8)(0b10))
#define SIMPLEX_MODE                                    ((UINT8)(0b01))
#define ASYNCRONOUS_MODE                                ((UINT8)(0b00))

#define UART_WAKE_UP_SHIFT                              ((UINT8)(7))
#define WAKE_UP_DISABLED                                ((UINT8)(0))
#define WAKE_UP_ENABLED                                 ((UINT8)(1))

#define UART_LOOPBACK_SHIFT                             ((UINT8)(6))
#define LOOPBACK_DISABLED                               ((UINT8)(0))
#define LOOPBACK_ENABLED                                ((UINT8)(1))

#define UART_AUTOBAUD_SHIFT                             ((UINT8)(5))
#define AUTOBAUD_DISABLED                               ((UINT8)(0))
#define AUTOBAUD_ENABLED                                ((UINT8)(1))

#define UART_RX_POLARITY_SHIFT                          ((UINT8)(4))
#define NORMAL_POLARITY                                 ((UINT8)(0))
#define INVERSE_POLARITY                                ((UINT8)(1))

#define UART_BRG_SPEED_SHIFT                            ((UINT8)(3))
#define STANDARD_SPEED                                  ((UINT8)(0))
#define HIGH_SPEED                                      ((UINT8)(1))

#define UART_PARITY_SHIFT                               ((UINT8)(1))
#define NO_PARITY_9_BIT                                 ((UINT8)(0b11))
#define ODD_PARITY_8_BIT                                ((UINT8)(0b10))
#define EVEN_PARITY_8_BIT                               ((UINT8)(0b01))
#define NO_PARITY_8_BIT                                 ((UINT8)(0b00))

#define UART_STOP_BIT_SHIFT                             ((UINT8)(0))
#define ONE_STOP_BIT                                    ((UINT8)(0))
#define TWO_STOP_BIT                                    ((UINT8)(1))

/* UxSTA */
#define UART_RECEIVER_ENABLED_SHIFT                     ((UINT8)(12))
#define RECEIVER_DISBALED                               ((UINT8)(0))
#define RECEIVER_ENBALED                                ((UINT8)(1))

#define UART_TX_BREAK_SHIFT                             ((UINT8)(11))
#define TX_BREAK_DISABLED                               ((UINT8)(0))
#define TX_BREAK_ENABLED                                ((UINT8)(1))

#define UART_TRANSMITTER_ENABLED_SHIFT                  ((UINT8)(10))
#define TRANSMITTER_DISBALED                            ((UINT8)(0))
#define TRANSMITTER_ENBALED                             ((UINT8)(1))
/* Read-only */
#define UART_TX_BUFFER_FULL_SHIFT                       ((UINT8)(9))
#define TX_BUFFER_IS_NOT_FULL                           ((UINT8)(0))
#define TX_BUFFER_IS_FULL                               ((UINT8)(1))
/* Read-only */
#define UART_TX_SHIFT_REG_EMPTY_SHIFT                   ((UINT8)(8))
#define TX_SHIFT_REG_IS_NOT_EMPTY                       ((UINT8)(0))
#define TX_SHIFT_REG_IS_EMPTY                           ((UINT8)(1))
/* Read-only */
#define UART_RX_IDLE_SHIFT                              ((UINT8)(4))
#define RX_DATA_IN_PROGRESS                             ((UINT8)(0))
#define RX_IDLE                                         ((UINT8)(1))
/* Read-only */
#define UART_PARITY_ERROR_STATUS_SHIFT                  ((UINT8)(3))
#define PARITY_ERROR_NOT_DETECTED                       ((UINT8)(0))
#define PARITY_ERROR_DETECTED                           ((UINT8)(1))
/* Read-only */
#define UART_FRAMING_ERROR_STATUS_SHIFT                 ((UINT8)(2))
#define FRAMING_ERROR_NOT_DETECTED                      ((UINT8)(0))
#define FRAMING_ERROR_DETECTED                          ((UINT8)(1))
/* Read-only */
#define UART_RX_OVERRUN_SHIFT                           ((UINT8)(1))
#define RX_OVERRUN_ERROR_NOT_DETECTED                   ((UINT8)(0))
#define RX_OVERRUN_ERROR_DETECTED                       ((UINT8)(1))
/* Read-only */
#define UART_RX_BUFFER_STATUS_SHIFT                     ((UINT8)(0))
#define DATA_PRESENT_IN_RX_BUFFER                       ((UINT8)(0))
#define NO_DATA_IN_RX_BUFFER                            ((UINT8)(1))

/************************************************************************
* Typedef
************************************************************************/
/* Tx Buffer status */
typedef enum _TxBufferStatus
{
    TxBufferNotFull,
    TxBufferFull,
    TxBufferEmpty,
} TxBufferStatusType;

/* Rx Buffer status */
typedef enum _RxBufferStatus
{
    RxBufferNotFull,
    RxBufferIdle,
    RxBufferNoData,
} RxBufferStatusType;

/* Uart confi type*/
typedef struct _UartConfig
{
    UINT8 UartModuleSts;
    UINT8 StopIdle;
    UINT8 IrdaEncoder;  
    UINT8 RtsMode;  
    UINT8 UartMode; 
    UINT8 WakeUp;
    UINT8 LoopBack;
    UINT8 Autobaud;
    UINT8 RxPolarity;
    UINT8 BrgSpeed;
    UINT8 ParityBit;
    UINT8 StopBit;
    UINT8 ReceiverEnabled;
    UINT8 TxBreak;
    UINT8 TransEnabled;
    UINT32 PeripheralBusClockHz;
} UartConfigType;

/************************************************************************
* Global Variables
************************************************************************/
extern UartConfigType Uart_UartConfig;

/************************************************************************
* Function
************************************************************************/
void Uart_SetConfig (void);
void Uart_InitUartModule (UartConfigType *UartConfig);
void Uart_WriteByte (UINT8 ByteToWrite);
UINT8 Uart_ReadByte (void);
TxBufferStatusType Uart_TxBufferStatus (void);
RxBufferStatusType Uart_RxBufferStatus (void);
void Uart_WriteConstString (const UINT8 *ConstStringToWrite);
void Uart_WriteString (UINT8 *StringToWrite);

#endif	/* UART_DRIVER_H */

