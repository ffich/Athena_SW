/************************************************************************
*                             TcpIp Task                                *
*************************************************************************
* FileName:         tcpip_task.c                                        *
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
* F.Ficili     31/05/15     1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "tcpip_task.h"

/************************************************************************
* Global Variables
************************************************************************/
/* Declare AppConfig structure */
APP_CONFIG AppConfig;
/* Activation/deactivation events */
EventStructureType ActivateTcpIpTask = {NO_MASK, EventIdle};
EventStructureType DeactivateTcpIpTask = {NO_MASK, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/
/* Checksum of the ROM defaults for AppConfig */
static unsigned short wOriginalAppConfigChecksum;
/* Serialized MAC */
static ROM BYTE SerializedMACAddress[MAC_LENGHT] = {MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3, MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6};

/************************************************************************
* Local Prototypes
************************************************************************/
void TcpIpStackTasks (void);
void TcpIpInitStack (void);
void InitAppConfig(void);

/************************************************************************
* Function Prototypes
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     TcpIpTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Manage TCPIP Task
* Date:		31/05/15
************************************************************************/
void TcpIpTask (void)
{
    /* Task status */
    static UINT8 TaskStatus = K_TASK_NOT_RUNNING;

    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Initialize tcpip statck */
            TcpIpInitStack();
            break;

        /* System Normal operaion Phase */
        case RunningState:
            /* Check activation/deactivation events */
            if (ReceiveEvt(&ActivateTcpIpTask))
            {
                /* Activate task */
                TaskStatus = K_TASK_RUNNING;
            }
            else if (ReceiveEvt(&DeactivateTcpIpTask))
            {
                /* Deactivate task */
                TaskStatus = K_TASK_NOT_RUNNING;
            }
            else
            {
                /* Do nothing */
            }

            /* Check task status */
            if (TaskStatus == K_TASK_RUNNING)
            {
                /* Call tcpip tasks */
                TcpIpStackTasks();
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
* Function:     TcpIpInitStack
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Initialize the TCPIP stack
* Date:		31/05/15
************************************************************************/
void TcpIpInitStack (void)
{
    /* Init tick counts */
    TickInit();
    /* Init MPFS */
    MPFSInit();
    /* Init AppcConfig */
    InitAppConfig();
    /* Init stack */

    StackInit();
}

#ifndef COMPLEX_TASKS
/************************************************************************
* Function:     TcpIpStackTasks
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Manage the TCPIP necessary tasks
* Date:		31/05/15
************************************************************************/
void TcpIpStackTasks (void)
{
    /* Perform Stack Tasks */
    StackTask();

    /* This tasks invokes each of the core stack application tasks */
    StackApplications();
}
#endif

#ifdef COMPLEX_TASKS
/************************************************************************
* Function:     TcpIpStackTasks
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Manage the TCPIP necessary tasks
* Date:		31/05/15
************************************************************************/
void TcpIpStackTasks (void)
{
    static UINT32 LastIp = 0;

    /* Perform Stack Tasks */
    StackTask();

    /* This tasks invokes each of the core stack application tasks */
    StackApplications();

    #if defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE)
    GenericTCPClient();
    #endif    

    #if defined(STACK_USE_GENERIC_TCP_SERVER_EXAMPLE)
    GenericTCPServer();
    #endif

    #if defined(STACK_USE_SMTP_CLIENT)
    SMTPDemo();
    #endif

    #if defined(STACK_USE_ICMP_CLIENT)
    PingDemo();
    #endif

    #if defined(STACK_USE_BERKELEY_API)
    BerkeleyTCPClientDemo();
    BerkeleyTCPServerDemo();
    BerkeleyUDPClientDemo();
    #endif

    if(LastIp != AppConfig.MyIPAddr.Val)
    {
        LastIp = AppConfig.MyIPAddr.Val;

        #if defined(STACK_USE_ANNOUNCE)
            AnnounceIP();
        #endif
    }
}
#endif

/************************************************************************
* Function:     InitAppConfig
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Set AppConfig fields
* Date:		31/05/15
************************************************************************/
void InitAppConfig(void)
{
    /*
    Start out zeroing all AppConfig bytes to ensure all fields are
    deterministic for checksum generation
    */
    memset((void*)&AppConfig, 0x00, sizeof(AppConfig));

    /* Set AppConfiog fields */
    AppConfig.Flags.bIsDHCPEnabled = TRUE;
    AppConfig.Flags.bInConfigMode = TRUE;
    memcpypgm2ram((void*)&AppConfig.MyMACAddr, (ROM void*)SerializedMACAddress, sizeof(AppConfig.MyMACAddr));
    AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | MY_DEFAULT_IP_ADDR_BYTE2<<8ul | MY_DEFAULT_IP_ADDR_BYTE3<<16ul | MY_DEFAULT_IP_ADDR_BYTE4<<24ul;
    AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
    AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | MY_DEFAULT_MASK_BYTE2<<8ul | MY_DEFAULT_MASK_BYTE3<<16ul | MY_DEFAULT_MASK_BYTE4<<24ul;
    AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
    AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | MY_DEFAULT_GATE_BYTE2<<8ul | MY_DEFAULT_GATE_BYTE3<<16ul | MY_DEFAULT_GATE_BYTE4<<24ul;
    AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | MY_DEFAULT_PRIMARY_DNS_BYTE2<<8ul  | MY_DEFAULT_PRIMARY_DNS_BYTE3<<16ul  | MY_DEFAULT_PRIMARY_DNS_BYTE4<<24ul;
    AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | MY_DEFAULT_SECONDARY_DNS_BYTE2<<8ul  | MY_DEFAULT_SECONDARY_DNS_BYTE3<<16ul  | MY_DEFAULT_SECONDARY_DNS_BYTE4<<24ul;
    /* Load the default NetBIOS Host Name */
    memcpypgm2ram(AppConfig.NetBIOSName, (ROM void*)MY_DEFAULT_HOST_NAME, 16);
    FormatNetBIOSName(AppConfig.NetBIOSName);
    /* Compute the checksum of the AppConfig defaults as loaded from ROM */
    wOriginalAppConfigChecksum = CalcIPChecksum((BYTE*)&AppConfig, sizeof(AppConfig));
}

/************************************************************************
* Function:     HTTPPrint_hname
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Print hostname callback
* Date:		31/05/15
************************************************************************/
void HTTPPrint_hname(void)
{
    TCPPutString(sktHTTP,AppConfig.NetBIOSName);
}

/************************************************************************
* Function:     HTTPPrint_led_sts
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Print led status callback
* Date:		31/05/15
************************************************************************/
void HTTPPrint_led_sts(void)
{
    if (BSP_LED_1)
    {
        TCPPutString(sktHTTP,"On");
    }
    else
    {
        TCPPutString(sktHTTP,"Off");
    }
}

/************************************************************************
* Function:     HTTPExecuteGet
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:	Execute get callback
* Date:		31/05/15
************************************************************************/
HTTP_IO_RESULT HTTPExecuteGet(void)
{
    BYTE *DataPtr;

    /* Get data */
    DataPtr = HTTPGetROMArg(curHTTP.data,(ROM BYTE *)"led");

    /* Check if data is present inside the pointer */
    if(DataPtr)
    {
        /* If "on" data has been passed */
        if(strcmppgm2ram((char*)DataPtr,(ROM char*)"on") == 0)
        {
            /* Send on evt */
            GenerateEvt(&Led2On);
         }

        else
        {
            /* Send off evt */
            GenerateEvt(&Led2Off);
        }
    }
}