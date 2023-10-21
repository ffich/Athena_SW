#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Source/c/Bsp/system_init.c ../Source/c/Drivers/adc_driver.c ../Source/c/Drivers/i2c_driver.c ../Source/c/Drivers/joystick_driver.c ../Source/c/Drivers/lcd_driver.c ../Source/c/Drivers/led_driver.c ../Source/c/Drivers/uart_driver.c ../Source/c/Main/main.c ../Source/c/Sched/interrupts.c ../Source/c/Sched/scheduler.c ../Source/c/Stacks/Sd/SD-SPI.c ../Source/c/Stacks/TcpIp/Announce.c ../Source/c/Stacks/TcpIp/ARCFOUR.c ../Source/c/Stacks/TcpIp/ARP.c ../Source/c/Stacks/TcpIp/AutoIP.c ../Source/c/Stacks/TcpIp/BerkeleyAPI.c ../Source/c/Stacks/TcpIp/BigInt.c ../Source/c/Stacks/TcpIp/Delay.c ../Source/c/Stacks/TcpIp/DHCP.c ../Source/c/Stacks/TcpIp/DHCPs.c ../Source/c/Stacks/TcpIp/DNS.c ../Source/c/Stacks/TcpIp/DNSs.c ../Source/c/Stacks/TcpIp/DynDNS.c ../Source/c/Stacks/TcpIp/ENC28J60.c ../Source/c/Stacks/TcpIp/ENCX24J600.c ../Source/c/Stacks/TcpIp/ETH97J60.c ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c ../Source/c/Stacks/TcpIp/FileSystem.c ../Source/c/Stacks/TcpIp/FTP.c ../Source/c/Stacks/TcpIp/Hashes.c ../Source/c/Stacks/TcpIp/Helpers.c ../Source/c/Stacks/TcpIp/HTTP2.c ../Source/c/Stacks/TcpIp/ICMP.c ../Source/c/Stacks/TcpIp/IP.c ../Source/c/Stacks/TcpIp/LCDBlocking.c ../Source/c/Stacks/TcpIp/MPFS2.c ../Source/c/Stacks/TcpIp/MPFSImg2.c ../Source/c/Stacks/TcpIp/NBNS.c ../Source/c/Stacks/TcpIp/Random.c ../Source/c/Stacks/TcpIp/Reboot.c ../Source/c/Stacks/TcpIp/RSA.c ../Source/c/Stacks/TcpIp/SMTP.c ../Source/c/Stacks/TcpIp/SNMP.c ../Source/c/Stacks/TcpIp/SNMPv3.c ../Source/c/Stacks/TcpIp/SNMPv3USM.c ../Source/c/Stacks/TcpIp/SNTP.c ../Source/c/Stacks/TcpIp/SPIEEPROM.c ../Source/c/Stacks/TcpIp/SPIFlash.c ../Source/c/Stacks/TcpIp/SPIRAM.c ../Source/c/Stacks/TcpIp/SSL.c ../Source/c/Stacks/TcpIp/StackTsk.c ../Source/c/Stacks/TcpIp/TCP.c ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c ../Source/c/Stacks/TcpIp/Telnet.c ../Source/c/Stacks/TcpIp/TFTPc.c ../Source/c/Stacks/TcpIp/Tick.c ../Source/c/Stacks/TcpIp/UART.c ../Source/c/Stacks/TcpIp/UART2TCPBridge.c ../Source/c/Stacks/TcpIp/UDP.c ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c ../Source/c/Stacks/TcpIp/ZeroconfHelper.c ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c ../Source/c/Stacks/Usb/fsio.c ../Source/c/Stacks/Usb/usb_config.c ../Source/c/Stacks/Usb/usb_host.c ../Source/c/Stacks/Usb/usb_host_msd.c ../Source/c/Stacks/Usb/usb_host_msd_scsi.c ../Source/c/Tasks/adc_task.c ../Source/c/Tasks/app_task.c ../Source/c/Tasks/com_task.c ../Source/c/Tasks/led_task.c ../Source/c/Tasks/mcp23008_task.c ../Source/c/Tasks/tcpip_task.c ../Source/c/Tasks/test_task.c ../Source/c/Tasks/usb_task.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1614233714/system_init.o ${OBJECTDIR}/_ext/1863216922/adc_driver.o ${OBJECTDIR}/_ext/1863216922/i2c_driver.o ${OBJECTDIR}/_ext/1863216922/joystick_driver.o ${OBJECTDIR}/_ext/1863216922/lcd_driver.o ${OBJECTDIR}/_ext/1863216922/led_driver.o ${OBJECTDIR}/_ext/1863216922/uart_driver.o ${OBJECTDIR}/_ext/1498672714/main.o ${OBJECTDIR}/_ext/780186554/interrupts.o ${OBJECTDIR}/_ext/780186554/scheduler.o ${OBJECTDIR}/_ext/1649800668/SD-SPI.o ${OBJECTDIR}/_ext/1899928523/Announce.o ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o ${OBJECTDIR}/_ext/1899928523/ARP.o ${OBJECTDIR}/_ext/1899928523/AutoIP.o ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o ${OBJECTDIR}/_ext/1899928523/BigInt.o ${OBJECTDIR}/_ext/1899928523/Delay.o ${OBJECTDIR}/_ext/1899928523/DHCP.o ${OBJECTDIR}/_ext/1899928523/DHCPs.o ${OBJECTDIR}/_ext/1899928523/DNS.o ${OBJECTDIR}/_ext/1899928523/DNSs.o ${OBJECTDIR}/_ext/1899928523/DynDNS.o ${OBJECTDIR}/_ext/1899928523/ENC28J60.o ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o ${OBJECTDIR}/_ext/1899928523/ETH97J60.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1899928523/FileSystem.o ${OBJECTDIR}/_ext/1899928523/FTP.o ${OBJECTDIR}/_ext/1899928523/Hashes.o ${OBJECTDIR}/_ext/1899928523/Helpers.o ${OBJECTDIR}/_ext/1899928523/HTTP2.o ${OBJECTDIR}/_ext/1899928523/ICMP.o ${OBJECTDIR}/_ext/1899928523/IP.o ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o ${OBJECTDIR}/_ext/1899928523/MPFS2.o ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o ${OBJECTDIR}/_ext/1899928523/NBNS.o ${OBJECTDIR}/_ext/1899928523/Random.o ${OBJECTDIR}/_ext/1899928523/Reboot.o ${OBJECTDIR}/_ext/1899928523/RSA.o ${OBJECTDIR}/_ext/1899928523/SMTP.o ${OBJECTDIR}/_ext/1899928523/SNMP.o ${OBJECTDIR}/_ext/1899928523/SNMPv3.o ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o ${OBJECTDIR}/_ext/1899928523/SNTP.o ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o ${OBJECTDIR}/_ext/1899928523/SPIFlash.o ${OBJECTDIR}/_ext/1899928523/SPIRAM.o ${OBJECTDIR}/_ext/1899928523/SSL.o ${OBJECTDIR}/_ext/1899928523/StackTsk.o ${OBJECTDIR}/_ext/1899928523/TCP.o ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1899928523/Telnet.o ${OBJECTDIR}/_ext/1899928523/TFTPc.o ${OBJECTDIR}/_ext/1899928523/Tick.o ${OBJECTDIR}/_ext/1899928523/UART.o ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o ${OBJECTDIR}/_ext/1899928523/UDP.o ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o ${OBJECTDIR}/_ext/395789329/fsio.o ${OBJECTDIR}/_ext/395789329/usb_config.o ${OBJECTDIR}/_ext/395789329/usb_host.o ${OBJECTDIR}/_ext/395789329/usb_host_msd.o ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/779311843/adc_task.o ${OBJECTDIR}/_ext/779311843/app_task.o ${OBJECTDIR}/_ext/779311843/com_task.o ${OBJECTDIR}/_ext/779311843/led_task.o ${OBJECTDIR}/_ext/779311843/mcp23008_task.o ${OBJECTDIR}/_ext/779311843/tcpip_task.o ${OBJECTDIR}/_ext/779311843/test_task.o ${OBJECTDIR}/_ext/779311843/usb_task.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1614233714/system_init.o.d ${OBJECTDIR}/_ext/1863216922/adc_driver.o.d ${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d ${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d ${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d ${OBJECTDIR}/_ext/1863216922/led_driver.o.d ${OBJECTDIR}/_ext/1863216922/uart_driver.o.d ${OBJECTDIR}/_ext/1498672714/main.o.d ${OBJECTDIR}/_ext/780186554/interrupts.o.d ${OBJECTDIR}/_ext/780186554/scheduler.o.d ${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d ${OBJECTDIR}/_ext/1899928523/Announce.o.d ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d ${OBJECTDIR}/_ext/1899928523/ARP.o.d ${OBJECTDIR}/_ext/1899928523/AutoIP.o.d ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d ${OBJECTDIR}/_ext/1899928523/BigInt.o.d ${OBJECTDIR}/_ext/1899928523/Delay.o.d ${OBJECTDIR}/_ext/1899928523/DHCP.o.d ${OBJECTDIR}/_ext/1899928523/DHCPs.o.d ${OBJECTDIR}/_ext/1899928523/DNS.o.d ${OBJECTDIR}/_ext/1899928523/DNSs.o.d ${OBJECTDIR}/_ext/1899928523/DynDNS.o.d ${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d ${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d ${OBJECTDIR}/_ext/1899928523/FileSystem.o.d ${OBJECTDIR}/_ext/1899928523/FTP.o.d ${OBJECTDIR}/_ext/1899928523/Hashes.o.d ${OBJECTDIR}/_ext/1899928523/Helpers.o.d ${OBJECTDIR}/_ext/1899928523/HTTP2.o.d ${OBJECTDIR}/_ext/1899928523/ICMP.o.d ${OBJECTDIR}/_ext/1899928523/IP.o.d ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d ${OBJECTDIR}/_ext/1899928523/MPFS2.o.d ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d ${OBJECTDIR}/_ext/1899928523/NBNS.o.d ${OBJECTDIR}/_ext/1899928523/Random.o.d ${OBJECTDIR}/_ext/1899928523/Reboot.o.d ${OBJECTDIR}/_ext/1899928523/RSA.o.d ${OBJECTDIR}/_ext/1899928523/SMTP.o.d ${OBJECTDIR}/_ext/1899928523/SNMP.o.d ${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d ${OBJECTDIR}/_ext/1899928523/SNTP.o.d ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d ${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d ${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d ${OBJECTDIR}/_ext/1899928523/SSL.o.d ${OBJECTDIR}/_ext/1899928523/StackTsk.o.d ${OBJECTDIR}/_ext/1899928523/TCP.o.d ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1899928523/Telnet.o.d ${OBJECTDIR}/_ext/1899928523/TFTPc.o.d ${OBJECTDIR}/_ext/1899928523/Tick.o.d ${OBJECTDIR}/_ext/1899928523/UART.o.d ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d ${OBJECTDIR}/_ext/1899928523/UDP.o.d ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d ${OBJECTDIR}/_ext/395789329/fsio.o.d ${OBJECTDIR}/_ext/395789329/usb_config.o.d ${OBJECTDIR}/_ext/395789329/usb_host.o.d ${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d ${OBJECTDIR}/_ext/779311843/adc_task.o.d ${OBJECTDIR}/_ext/779311843/app_task.o.d ${OBJECTDIR}/_ext/779311843/com_task.o.d ${OBJECTDIR}/_ext/779311843/led_task.o.d ${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d ${OBJECTDIR}/_ext/779311843/tcpip_task.o.d ${OBJECTDIR}/_ext/779311843/test_task.o.d ${OBJECTDIR}/_ext/779311843/usb_task.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1614233714/system_init.o ${OBJECTDIR}/_ext/1863216922/adc_driver.o ${OBJECTDIR}/_ext/1863216922/i2c_driver.o ${OBJECTDIR}/_ext/1863216922/joystick_driver.o ${OBJECTDIR}/_ext/1863216922/lcd_driver.o ${OBJECTDIR}/_ext/1863216922/led_driver.o ${OBJECTDIR}/_ext/1863216922/uart_driver.o ${OBJECTDIR}/_ext/1498672714/main.o ${OBJECTDIR}/_ext/780186554/interrupts.o ${OBJECTDIR}/_ext/780186554/scheduler.o ${OBJECTDIR}/_ext/1649800668/SD-SPI.o ${OBJECTDIR}/_ext/1899928523/Announce.o ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o ${OBJECTDIR}/_ext/1899928523/ARP.o ${OBJECTDIR}/_ext/1899928523/AutoIP.o ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o ${OBJECTDIR}/_ext/1899928523/BigInt.o ${OBJECTDIR}/_ext/1899928523/Delay.o ${OBJECTDIR}/_ext/1899928523/DHCP.o ${OBJECTDIR}/_ext/1899928523/DHCPs.o ${OBJECTDIR}/_ext/1899928523/DNS.o ${OBJECTDIR}/_ext/1899928523/DNSs.o ${OBJECTDIR}/_ext/1899928523/DynDNS.o ${OBJECTDIR}/_ext/1899928523/ENC28J60.o ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o ${OBJECTDIR}/_ext/1899928523/ETH97J60.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1899928523/FileSystem.o ${OBJECTDIR}/_ext/1899928523/FTP.o ${OBJECTDIR}/_ext/1899928523/Hashes.o ${OBJECTDIR}/_ext/1899928523/Helpers.o ${OBJECTDIR}/_ext/1899928523/HTTP2.o ${OBJECTDIR}/_ext/1899928523/ICMP.o ${OBJECTDIR}/_ext/1899928523/IP.o ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o ${OBJECTDIR}/_ext/1899928523/MPFS2.o ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o ${OBJECTDIR}/_ext/1899928523/NBNS.o ${OBJECTDIR}/_ext/1899928523/Random.o ${OBJECTDIR}/_ext/1899928523/Reboot.o ${OBJECTDIR}/_ext/1899928523/RSA.o ${OBJECTDIR}/_ext/1899928523/SMTP.o ${OBJECTDIR}/_ext/1899928523/SNMP.o ${OBJECTDIR}/_ext/1899928523/SNMPv3.o ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o ${OBJECTDIR}/_ext/1899928523/SNTP.o ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o ${OBJECTDIR}/_ext/1899928523/SPIFlash.o ${OBJECTDIR}/_ext/1899928523/SPIRAM.o ${OBJECTDIR}/_ext/1899928523/SSL.o ${OBJECTDIR}/_ext/1899928523/StackTsk.o ${OBJECTDIR}/_ext/1899928523/TCP.o ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1899928523/Telnet.o ${OBJECTDIR}/_ext/1899928523/TFTPc.o ${OBJECTDIR}/_ext/1899928523/Tick.o ${OBJECTDIR}/_ext/1899928523/UART.o ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o ${OBJECTDIR}/_ext/1899928523/UDP.o ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o ${OBJECTDIR}/_ext/395789329/fsio.o ${OBJECTDIR}/_ext/395789329/usb_config.o ${OBJECTDIR}/_ext/395789329/usb_host.o ${OBJECTDIR}/_ext/395789329/usb_host_msd.o ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/779311843/adc_task.o ${OBJECTDIR}/_ext/779311843/app_task.o ${OBJECTDIR}/_ext/779311843/com_task.o ${OBJECTDIR}/_ext/779311843/led_task.o ${OBJECTDIR}/_ext/779311843/mcp23008_task.o ${OBJECTDIR}/_ext/779311843/tcpip_task.o ${OBJECTDIR}/_ext/779311843/test_task.o ${OBJECTDIR}/_ext/779311843/usb_task.o

# Source Files
SOURCEFILES=../Source/c/Bsp/system_init.c ../Source/c/Drivers/adc_driver.c ../Source/c/Drivers/i2c_driver.c ../Source/c/Drivers/joystick_driver.c ../Source/c/Drivers/lcd_driver.c ../Source/c/Drivers/led_driver.c ../Source/c/Drivers/uart_driver.c ../Source/c/Main/main.c ../Source/c/Sched/interrupts.c ../Source/c/Sched/scheduler.c ../Source/c/Stacks/Sd/SD-SPI.c ../Source/c/Stacks/TcpIp/Announce.c ../Source/c/Stacks/TcpIp/ARCFOUR.c ../Source/c/Stacks/TcpIp/ARP.c ../Source/c/Stacks/TcpIp/AutoIP.c ../Source/c/Stacks/TcpIp/BerkeleyAPI.c ../Source/c/Stacks/TcpIp/BigInt.c ../Source/c/Stacks/TcpIp/Delay.c ../Source/c/Stacks/TcpIp/DHCP.c ../Source/c/Stacks/TcpIp/DHCPs.c ../Source/c/Stacks/TcpIp/DNS.c ../Source/c/Stacks/TcpIp/DNSs.c ../Source/c/Stacks/TcpIp/DynDNS.c ../Source/c/Stacks/TcpIp/ENC28J60.c ../Source/c/Stacks/TcpIp/ENCX24J600.c ../Source/c/Stacks/TcpIp/ETH97J60.c ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c ../Source/c/Stacks/TcpIp/FileSystem.c ../Source/c/Stacks/TcpIp/FTP.c ../Source/c/Stacks/TcpIp/Hashes.c ../Source/c/Stacks/TcpIp/Helpers.c ../Source/c/Stacks/TcpIp/HTTP2.c ../Source/c/Stacks/TcpIp/ICMP.c ../Source/c/Stacks/TcpIp/IP.c ../Source/c/Stacks/TcpIp/LCDBlocking.c ../Source/c/Stacks/TcpIp/MPFS2.c ../Source/c/Stacks/TcpIp/MPFSImg2.c ../Source/c/Stacks/TcpIp/NBNS.c ../Source/c/Stacks/TcpIp/Random.c ../Source/c/Stacks/TcpIp/Reboot.c ../Source/c/Stacks/TcpIp/RSA.c ../Source/c/Stacks/TcpIp/SMTP.c ../Source/c/Stacks/TcpIp/SNMP.c ../Source/c/Stacks/TcpIp/SNMPv3.c ../Source/c/Stacks/TcpIp/SNMPv3USM.c ../Source/c/Stacks/TcpIp/SNTP.c ../Source/c/Stacks/TcpIp/SPIEEPROM.c ../Source/c/Stacks/TcpIp/SPIFlash.c ../Source/c/Stacks/TcpIp/SPIRAM.c ../Source/c/Stacks/TcpIp/SSL.c ../Source/c/Stacks/TcpIp/StackTsk.c ../Source/c/Stacks/TcpIp/TCP.c ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c ../Source/c/Stacks/TcpIp/Telnet.c ../Source/c/Stacks/TcpIp/TFTPc.c ../Source/c/Stacks/TcpIp/Tick.c ../Source/c/Stacks/TcpIp/UART.c ../Source/c/Stacks/TcpIp/UART2TCPBridge.c ../Source/c/Stacks/TcpIp/UDP.c ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c ../Source/c/Stacks/TcpIp/ZeroconfHelper.c ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c ../Source/c/Stacks/Usb/fsio.c ../Source/c/Stacks/Usb/usb_config.c ../Source/c/Stacks/Usb/usb_host.c ../Source/c/Stacks/Usb/usb_host_msd.c ../Source/c/Stacks/Usb/usb_host_msd_scsi.c ../Source/c/Tasks/adc_task.c ../Source/c/Tasks/app_task.c ../Source/c/Tasks/com_task.c ../Source/c/Tasks/led_task.c ../Source/c/Tasks/mcp23008_task.c ../Source/c/Tasks/tcpip_task.c ../Source/c/Tasks/test_task.c ../Source/c/Tasks/usb_task.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\Source\_Linker\UsbHostBoot\app_32MX795F512L.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1614233714/system_init.o: ../Source/c/Bsp/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1614233714" 
	@${RM} ${OBJECTDIR}/_ext/1614233714/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1614233714/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1614233714/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1614233714/system_init.o.d" -o ${OBJECTDIR}/_ext/1614233714/system_init.o ../Source/c/Bsp/system_init.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/adc_driver.o: ../Source/c/Drivers/adc_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/adc_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/adc_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/adc_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/adc_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/adc_driver.o ../Source/c/Drivers/adc_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/i2c_driver.o: ../Source/c/Drivers/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/i2c_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/i2c_driver.o ../Source/c/Drivers/i2c_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/joystick_driver.o: ../Source/c/Drivers/joystick_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/joystick_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/joystick_driver.o ../Source/c/Drivers/joystick_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/lcd_driver.o: ../Source/c/Drivers/lcd_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/lcd_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/lcd_driver.o ../Source/c/Drivers/lcd_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/led_driver.o: ../Source/c/Drivers/led_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/led_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/led_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/led_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/led_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/led_driver.o ../Source/c/Drivers/led_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/uart_driver.o: ../Source/c/Drivers/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/uart_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/uart_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/uart_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/uart_driver.o ../Source/c/Drivers/uart_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1498672714/main.o: ../Source/c/Main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1498672714" 
	@${RM} ${OBJECTDIR}/_ext/1498672714/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1498672714/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1498672714/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1498672714/main.o.d" -o ${OBJECTDIR}/_ext/1498672714/main.o ../Source/c/Main/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/780186554/interrupts.o: ../Source/c/Sched/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/780186554" 
	@${RM} ${OBJECTDIR}/_ext/780186554/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/780186554/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/780186554/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/780186554/interrupts.o.d" -o ${OBJECTDIR}/_ext/780186554/interrupts.o ../Source/c/Sched/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/780186554/scheduler.o: ../Source/c/Sched/scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/780186554" 
	@${RM} ${OBJECTDIR}/_ext/780186554/scheduler.o.d 
	@${RM} ${OBJECTDIR}/_ext/780186554/scheduler.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/780186554/scheduler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/780186554/scheduler.o.d" -o ${OBJECTDIR}/_ext/780186554/scheduler.o ../Source/c/Sched/scheduler.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1649800668/SD-SPI.o: ../Source/c/Stacks/Sd/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1649800668" 
	@${RM} ${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649800668/SD-SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d" -o ${OBJECTDIR}/_ext/1649800668/SD-SPI.o ../Source/c/Stacks/Sd/SD-SPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Announce.o: ../Source/c/Stacks/TcpIp/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Announce.o.d" -o ${OBJECTDIR}/_ext/1899928523/Announce.o ../Source/c/Stacks/TcpIp/Announce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ARCFOUR.o: ../Source/c/Stacks/TcpIp/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d" -o ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o ../Source/c/Stacks/TcpIp/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ARP.o: ../Source/c/Stacks/TcpIp/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ARP.o.d" -o ${OBJECTDIR}/_ext/1899928523/ARP.o ../Source/c/Stacks/TcpIp/ARP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/AutoIP.o: ../Source/c/Stacks/TcpIp/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/AutoIP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/AutoIP.o.d" -o ${OBJECTDIR}/_ext/1899928523/AutoIP.o ../Source/c/Stacks/TcpIp/AutoIP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o: ../Source/c/Stacks/TcpIp/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d" -o ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o ../Source/c/Stacks/TcpIp/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/BigInt.o: ../Source/c/Stacks/TcpIp/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BigInt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/BigInt.o.d" -o ${OBJECTDIR}/_ext/1899928523/BigInt.o ../Source/c/Stacks/TcpIp/BigInt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Delay.o: ../Source/c/Stacks/TcpIp/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Delay.o.d" -o ${OBJECTDIR}/_ext/1899928523/Delay.o ../Source/c/Stacks/TcpIp/Delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DHCP.o: ../Source/c/Stacks/TcpIp/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DHCP.o.d" -o ${OBJECTDIR}/_ext/1899928523/DHCP.o ../Source/c/Stacks/TcpIp/DHCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DHCPs.o: ../Source/c/Stacks/TcpIp/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCPs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DHCPs.o.d" -o ${OBJECTDIR}/_ext/1899928523/DHCPs.o ../Source/c/Stacks/TcpIp/DHCPs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DNS.o: ../Source/c/Stacks/TcpIp/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/DNS.o ../Source/c/Stacks/TcpIp/DNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DNSs.o: ../Source/c/Stacks/TcpIp/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNSs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DNSs.o.d" -o ${OBJECTDIR}/_ext/1899928523/DNSs.o ../Source/c/Stacks/TcpIp/DNSs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DynDNS.o: ../Source/c/Stacks/TcpIp/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DynDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DynDNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/DynDNS.o ../Source/c/Stacks/TcpIp/DynDNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ENC28J60.o: ../Source/c/Stacks/TcpIp/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENC28J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d" -o ${OBJECTDIR}/_ext/1899928523/ENC28J60.o ../Source/c/Stacks/TcpIp/ENC28J60.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ENCX24J600.o: ../Source/c/Stacks/TcpIp/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d" -o ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o ../Source/c/Stacks/TcpIp/ENCX24J600.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETH97J60.o: ../Source/c/Stacks/TcpIp/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETH97J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETH97J60.o ../Source/c/Stacks/TcpIp/ETH97J60.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o: ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o: ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o: ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/FileSystem.o: ../Source/c/Stacks/TcpIp/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FileSystem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/FileSystem.o.d" -o ${OBJECTDIR}/_ext/1899928523/FileSystem.o ../Source/c/Stacks/TcpIp/FileSystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/FTP.o: ../Source/c/Stacks/TcpIp/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/FTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/FTP.o ../Source/c/Stacks/TcpIp/FTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Hashes.o: ../Source/c/Stacks/TcpIp/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Hashes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Hashes.o.d" -o ${OBJECTDIR}/_ext/1899928523/Hashes.o ../Source/c/Stacks/TcpIp/Hashes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Helpers.o: ../Source/c/Stacks/TcpIp/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Helpers.o.d" -o ${OBJECTDIR}/_ext/1899928523/Helpers.o ../Source/c/Stacks/TcpIp/Helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/HTTP2.o: ../Source/c/Stacks/TcpIp/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/HTTP2.o.d" -o ${OBJECTDIR}/_ext/1899928523/HTTP2.o ../Source/c/Stacks/TcpIp/HTTP2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ICMP.o: ../Source/c/Stacks/TcpIp/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ICMP.o.d" -o ${OBJECTDIR}/_ext/1899928523/ICMP.o ../Source/c/Stacks/TcpIp/ICMP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/IP.o: ../Source/c/Stacks/TcpIp/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/IP.o.d" -o ${OBJECTDIR}/_ext/1899928523/IP.o ../Source/c/Stacks/TcpIp/IP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/LCDBlocking.o: ../Source/c/Stacks/TcpIp/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d" -o ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o ../Source/c/Stacks/TcpIp/LCDBlocking.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/MPFS2.o: ../Source/c/Stacks/TcpIp/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/MPFS2.o.d" -o ${OBJECTDIR}/_ext/1899928523/MPFS2.o ../Source/c/Stacks/TcpIp/MPFS2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/MPFSImg2.o: ../Source/c/Stacks/TcpIp/MPFSImg2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d" -o ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o ../Source/c/Stacks/TcpIp/MPFSImg2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/NBNS.o: ../Source/c/Stacks/TcpIp/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/NBNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/NBNS.o ../Source/c/Stacks/TcpIp/NBNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Random.o: ../Source/c/Stacks/TcpIp/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Random.o.d" -o ${OBJECTDIR}/_ext/1899928523/Random.o ../Source/c/Stacks/TcpIp/Random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Reboot.o: ../Source/c/Stacks/TcpIp/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Reboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Reboot.o.d" -o ${OBJECTDIR}/_ext/1899928523/Reboot.o ../Source/c/Stacks/TcpIp/Reboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/RSA.o: ../Source/c/Stacks/TcpIp/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/RSA.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/RSA.o.d" -o ${OBJECTDIR}/_ext/1899928523/RSA.o ../Source/c/Stacks/TcpIp/RSA.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SMTP.o: ../Source/c/Stacks/TcpIp/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SMTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SMTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SMTP.o ../Source/c/Stacks/TcpIp/SMTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMP.o: ../Source/c/Stacks/TcpIp/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMP.o ../Source/c/Stacks/TcpIp/SNMP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMPv3.o: ../Source/c/Stacks/TcpIp/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMPv3.o ../Source/c/Stacks/TcpIp/SNMPv3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o: ../Source/c/Stacks/TcpIp/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o ../Source/c/Stacks/TcpIp/SNMPv3USM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNTP.o: ../Source/c/Stacks/TcpIp/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNTP.o ../Source/c/Stacks/TcpIp/SNTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o: ../Source/c/Stacks/TcpIp/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o ../Source/c/Stacks/TcpIp/SPIEEPROM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIFlash.o: ../Source/c/Stacks/TcpIp/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIFlash.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIFlash.o ../Source/c/Stacks/TcpIp/SPIFlash.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIRAM.o: ../Source/c/Stacks/TcpIp/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIRAM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIRAM.o ../Source/c/Stacks/TcpIp/SPIRAM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SSL.o: ../Source/c/Stacks/TcpIp/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SSL.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SSL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SSL.o.d" -o ${OBJECTDIR}/_ext/1899928523/SSL.o ../Source/c/Stacks/TcpIp/SSL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/StackTsk.o: ../Source/c/Stacks/TcpIp/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1899928523/StackTsk.o ../Source/c/Stacks/TcpIp/StackTsk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TCP.o: ../Source/c/Stacks/TcpIp/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TCP.o.d" -o ${OBJECTDIR}/_ext/1899928523/TCP.o ../Source/c/Stacks/TcpIp/TCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o: ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Telnet.o: ../Source/c/Stacks/TcpIp/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Telnet.o.d" -o ${OBJECTDIR}/_ext/1899928523/Telnet.o ../Source/c/Stacks/TcpIp/Telnet.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TFTPc.o: ../Source/c/Stacks/TcpIp/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TFTPc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TFTPc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TFTPc.o.d" -o ${OBJECTDIR}/_ext/1899928523/TFTPc.o ../Source/c/Stacks/TcpIp/TFTPc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Tick.o: ../Source/c/Stacks/TcpIp/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Tick.o.d" -o ${OBJECTDIR}/_ext/1899928523/Tick.o ../Source/c/Stacks/TcpIp/Tick.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UART.o: ../Source/c/Stacks/TcpIp/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UART.o.d" -o ${OBJECTDIR}/_ext/1899928523/UART.o ../Source/c/Stacks/TcpIp/UART.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o: ../Source/c/Stacks/TcpIp/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d" -o ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o ../Source/c/Stacks/TcpIp/UART2TCPBridge.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UDP.o: ../Source/c/Stacks/TcpIp/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UDP.o.d" -o ${OBJECTDIR}/_ext/1899928523/UDP.o ../Source/c/Stacks/TcpIp/UDP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o: ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o: ../Source/c/Stacks/TcpIp/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o ../Source/c/Stacks/TcpIp/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o: ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o: ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/fsio.o: ../Source/c/Stacks/Usb/fsio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/fsio.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/fsio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/fsio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/fsio.o.d" -o ${OBJECTDIR}/_ext/395789329/fsio.o ../Source/c/Stacks/Usb/fsio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_config.o: ../Source/c/Stacks/Usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_config.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_config.o ../Source/c/Stacks/Usb/usb_config.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host.o: ../Source/c/Stacks/Usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host.o ../Source/c/Stacks/Usb/usb_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host_msd.o: ../Source/c/Stacks/Usb/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host_msd.o ../Source/c/Stacks/Usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o: ../Source/c/Stacks/Usb/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o ../Source/c/Stacks/Usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/adc_task.o: ../Source/c/Tasks/adc_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/adc_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/adc_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/adc_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/adc_task.o.d" -o ${OBJECTDIR}/_ext/779311843/adc_task.o ../Source/c/Tasks/adc_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/app_task.o: ../Source/c/Tasks/app_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/app_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/app_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/app_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/app_task.o.d" -o ${OBJECTDIR}/_ext/779311843/app_task.o ../Source/c/Tasks/app_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/com_task.o: ../Source/c/Tasks/com_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/com_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/com_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/com_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/com_task.o.d" -o ${OBJECTDIR}/_ext/779311843/com_task.o ../Source/c/Tasks/com_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/led_task.o: ../Source/c/Tasks/led_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/led_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/led_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/led_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/led_task.o.d" -o ${OBJECTDIR}/_ext/779311843/led_task.o ../Source/c/Tasks/led_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/mcp23008_task.o: ../Source/c/Tasks/mcp23008_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/mcp23008_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d" -o ${OBJECTDIR}/_ext/779311843/mcp23008_task.o ../Source/c/Tasks/mcp23008_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/tcpip_task.o: ../Source/c/Tasks/tcpip_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/tcpip_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/tcpip_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/tcpip_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/tcpip_task.o.d" -o ${OBJECTDIR}/_ext/779311843/tcpip_task.o ../Source/c/Tasks/tcpip_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/test_task.o: ../Source/c/Tasks/test_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/test_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/test_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/test_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/test_task.o.d" -o ${OBJECTDIR}/_ext/779311843/test_task.o ../Source/c/Tasks/test_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/usb_task.o: ../Source/c/Tasks/usb_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/usb_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/usb_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/usb_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/usb_task.o.d" -o ${OBJECTDIR}/_ext/779311843/usb_task.o ../Source/c/Tasks/usb_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
else
${OBJECTDIR}/_ext/1614233714/system_init.o: ../Source/c/Bsp/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1614233714" 
	@${RM} ${OBJECTDIR}/_ext/1614233714/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1614233714/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1614233714/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1614233714/system_init.o.d" -o ${OBJECTDIR}/_ext/1614233714/system_init.o ../Source/c/Bsp/system_init.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/adc_driver.o: ../Source/c/Drivers/adc_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/adc_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/adc_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/adc_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/adc_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/adc_driver.o ../Source/c/Drivers/adc_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/i2c_driver.o: ../Source/c/Drivers/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/i2c_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/i2c_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/i2c_driver.o ../Source/c/Drivers/i2c_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/joystick_driver.o: ../Source/c/Drivers/joystick_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/joystick_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/joystick_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/joystick_driver.o ../Source/c/Drivers/joystick_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/lcd_driver.o: ../Source/c/Drivers/lcd_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/lcd_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/lcd_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/lcd_driver.o ../Source/c/Drivers/lcd_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/led_driver.o: ../Source/c/Drivers/led_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/led_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/led_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/led_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/led_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/led_driver.o ../Source/c/Drivers/led_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1863216922/uart_driver.o: ../Source/c/Drivers/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1863216922" 
	@${RM} ${OBJECTDIR}/_ext/1863216922/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1863216922/uart_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1863216922/uart_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1863216922/uart_driver.o.d" -o ${OBJECTDIR}/_ext/1863216922/uart_driver.o ../Source/c/Drivers/uart_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1498672714/main.o: ../Source/c/Main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1498672714" 
	@${RM} ${OBJECTDIR}/_ext/1498672714/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1498672714/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1498672714/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1498672714/main.o.d" -o ${OBJECTDIR}/_ext/1498672714/main.o ../Source/c/Main/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/780186554/interrupts.o: ../Source/c/Sched/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/780186554" 
	@${RM} ${OBJECTDIR}/_ext/780186554/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/780186554/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/780186554/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/780186554/interrupts.o.d" -o ${OBJECTDIR}/_ext/780186554/interrupts.o ../Source/c/Sched/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/780186554/scheduler.o: ../Source/c/Sched/scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/780186554" 
	@${RM} ${OBJECTDIR}/_ext/780186554/scheduler.o.d 
	@${RM} ${OBJECTDIR}/_ext/780186554/scheduler.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/780186554/scheduler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/780186554/scheduler.o.d" -o ${OBJECTDIR}/_ext/780186554/scheduler.o ../Source/c/Sched/scheduler.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1649800668/SD-SPI.o: ../Source/c/Stacks/Sd/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1649800668" 
	@${RM} ${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649800668/SD-SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1649800668/SD-SPI.o.d" -o ${OBJECTDIR}/_ext/1649800668/SD-SPI.o ../Source/c/Stacks/Sd/SD-SPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Announce.o: ../Source/c/Stacks/TcpIp/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Announce.o.d" -o ${OBJECTDIR}/_ext/1899928523/Announce.o ../Source/c/Stacks/TcpIp/Announce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ARCFOUR.o: ../Source/c/Stacks/TcpIp/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ARCFOUR.o.d" -o ${OBJECTDIR}/_ext/1899928523/ARCFOUR.o ../Source/c/Stacks/TcpIp/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ARP.o: ../Source/c/Stacks/TcpIp/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ARP.o.d" -o ${OBJECTDIR}/_ext/1899928523/ARP.o ../Source/c/Stacks/TcpIp/ARP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/AutoIP.o: ../Source/c/Stacks/TcpIp/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/AutoIP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/AutoIP.o.d" -o ${OBJECTDIR}/_ext/1899928523/AutoIP.o ../Source/c/Stacks/TcpIp/AutoIP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o: ../Source/c/Stacks/TcpIp/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o.d" -o ${OBJECTDIR}/_ext/1899928523/BerkeleyAPI.o ../Source/c/Stacks/TcpIp/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/BigInt.o: ../Source/c/Stacks/TcpIp/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/BigInt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/BigInt.o.d" -o ${OBJECTDIR}/_ext/1899928523/BigInt.o ../Source/c/Stacks/TcpIp/BigInt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Delay.o: ../Source/c/Stacks/TcpIp/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Delay.o.d" -o ${OBJECTDIR}/_ext/1899928523/Delay.o ../Source/c/Stacks/TcpIp/Delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DHCP.o: ../Source/c/Stacks/TcpIp/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DHCP.o.d" -o ${OBJECTDIR}/_ext/1899928523/DHCP.o ../Source/c/Stacks/TcpIp/DHCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DHCPs.o: ../Source/c/Stacks/TcpIp/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DHCPs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DHCPs.o.d" -o ${OBJECTDIR}/_ext/1899928523/DHCPs.o ../Source/c/Stacks/TcpIp/DHCPs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DNS.o: ../Source/c/Stacks/TcpIp/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/DNS.o ../Source/c/Stacks/TcpIp/DNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DNSs.o: ../Source/c/Stacks/TcpIp/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DNSs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DNSs.o.d" -o ${OBJECTDIR}/_ext/1899928523/DNSs.o ../Source/c/Stacks/TcpIp/DNSs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/DynDNS.o: ../Source/c/Stacks/TcpIp/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/DynDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/DynDNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/DynDNS.o ../Source/c/Stacks/TcpIp/DynDNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ENC28J60.o: ../Source/c/Stacks/TcpIp/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENC28J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ENC28J60.o.d" -o ${OBJECTDIR}/_ext/1899928523/ENC28J60.o ../Source/c/Stacks/TcpIp/ENC28J60.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ENCX24J600.o: ../Source/c/Stacks/TcpIp/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ENCX24J600.o.d" -o ${OBJECTDIR}/_ext/1899928523/ENCX24J600.o ../Source/c/Stacks/TcpIp/ENCX24J600.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETH97J60.o: ../Source/c/Stacks/TcpIp/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETH97J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETH97J60.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETH97J60.o ../Source/c/Stacks/TcpIp/ETH97J60.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o: ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhy.o ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhy.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o: ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32ExtPhyDP83848.o ../Source/c/Stacks/TcpIp/ETHPIC32ExtPhyDP83848.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o: ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1899928523/ETHPIC32IntMac.o ../Source/c/Stacks/TcpIp/ETHPIC32IntMac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/FileSystem.o: ../Source/c/Stacks/TcpIp/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FileSystem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/FileSystem.o.d" -o ${OBJECTDIR}/_ext/1899928523/FileSystem.o ../Source/c/Stacks/TcpIp/FileSystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/FTP.o: ../Source/c/Stacks/TcpIp/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/FTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/FTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/FTP.o ../Source/c/Stacks/TcpIp/FTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Hashes.o: ../Source/c/Stacks/TcpIp/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Hashes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Hashes.o.d" -o ${OBJECTDIR}/_ext/1899928523/Hashes.o ../Source/c/Stacks/TcpIp/Hashes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Helpers.o: ../Source/c/Stacks/TcpIp/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Helpers.o.d" -o ${OBJECTDIR}/_ext/1899928523/Helpers.o ../Source/c/Stacks/TcpIp/Helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/HTTP2.o: ../Source/c/Stacks/TcpIp/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/HTTP2.o.d" -o ${OBJECTDIR}/_ext/1899928523/HTTP2.o ../Source/c/Stacks/TcpIp/HTTP2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ICMP.o: ../Source/c/Stacks/TcpIp/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ICMP.o.d" -o ${OBJECTDIR}/_ext/1899928523/ICMP.o ../Source/c/Stacks/TcpIp/ICMP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/IP.o: ../Source/c/Stacks/TcpIp/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/IP.o.d" -o ${OBJECTDIR}/_ext/1899928523/IP.o ../Source/c/Stacks/TcpIp/IP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/LCDBlocking.o: ../Source/c/Stacks/TcpIp/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/LCDBlocking.o.d" -o ${OBJECTDIR}/_ext/1899928523/LCDBlocking.o ../Source/c/Stacks/TcpIp/LCDBlocking.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/MPFS2.o: ../Source/c/Stacks/TcpIp/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/MPFS2.o.d" -o ${OBJECTDIR}/_ext/1899928523/MPFS2.o ../Source/c/Stacks/TcpIp/MPFS2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/MPFSImg2.o: ../Source/c/Stacks/TcpIp/MPFSImg2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/MPFSImg2.o.d" -o ${OBJECTDIR}/_ext/1899928523/MPFSImg2.o ../Source/c/Stacks/TcpIp/MPFSImg2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/NBNS.o: ../Source/c/Stacks/TcpIp/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/NBNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/NBNS.o ../Source/c/Stacks/TcpIp/NBNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Random.o: ../Source/c/Stacks/TcpIp/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Random.o.d" -o ${OBJECTDIR}/_ext/1899928523/Random.o ../Source/c/Stacks/TcpIp/Random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Reboot.o: ../Source/c/Stacks/TcpIp/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Reboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Reboot.o.d" -o ${OBJECTDIR}/_ext/1899928523/Reboot.o ../Source/c/Stacks/TcpIp/Reboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/RSA.o: ../Source/c/Stacks/TcpIp/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/RSA.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/RSA.o.d" -o ${OBJECTDIR}/_ext/1899928523/RSA.o ../Source/c/Stacks/TcpIp/RSA.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SMTP.o: ../Source/c/Stacks/TcpIp/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SMTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SMTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SMTP.o ../Source/c/Stacks/TcpIp/SMTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMP.o: ../Source/c/Stacks/TcpIp/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMP.o ../Source/c/Stacks/TcpIp/SNMP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMPv3.o: ../Source/c/Stacks/TcpIp/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMPv3.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMPv3.o ../Source/c/Stacks/TcpIp/SNMPv3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o: ../Source/c/Stacks/TcpIp/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNMPv3USM.o ../Source/c/Stacks/TcpIp/SNMPv3USM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SNTP.o: ../Source/c/Stacks/TcpIp/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SNTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SNTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SNTP.o.d" -o ${OBJECTDIR}/_ext/1899928523/SNTP.o ../Source/c/Stacks/TcpIp/SNTP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o: ../Source/c/Stacks/TcpIp/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIEEPROM.o ../Source/c/Stacks/TcpIp/SPIEEPROM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIFlash.o: ../Source/c/Stacks/TcpIp/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIFlash.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIFlash.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIFlash.o ../Source/c/Stacks/TcpIp/SPIFlash.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SPIRAM.o: ../Source/c/Stacks/TcpIp/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SPIRAM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SPIRAM.o.d" -o ${OBJECTDIR}/_ext/1899928523/SPIRAM.o ../Source/c/Stacks/TcpIp/SPIRAM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/SSL.o: ../Source/c/Stacks/TcpIp/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SSL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/SSL.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/SSL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/SSL.o.d" -o ${OBJECTDIR}/_ext/1899928523/SSL.o ../Source/c/Stacks/TcpIp/SSL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/StackTsk.o: ../Source/c/Stacks/TcpIp/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1899928523/StackTsk.o ../Source/c/Stacks/TcpIp/StackTsk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TCP.o: ../Source/c/Stacks/TcpIp/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TCP.o.d" -o ${OBJECTDIR}/_ext/1899928523/TCP.o ../Source/c/Stacks/TcpIp/TCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o: ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1899928523/TCPPerformanceTest.o ../Source/c/Stacks/TcpIp/TCPPerformanceTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Telnet.o: ../Source/c/Stacks/TcpIp/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Telnet.o.d" -o ${OBJECTDIR}/_ext/1899928523/Telnet.o ../Source/c/Stacks/TcpIp/Telnet.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/TFTPc.o: ../Source/c/Stacks/TcpIp/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TFTPc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/TFTPc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/TFTPc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/TFTPc.o.d" -o ${OBJECTDIR}/_ext/1899928523/TFTPc.o ../Source/c/Stacks/TcpIp/TFTPc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/Tick.o: ../Source/c/Stacks/TcpIp/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/Tick.o.d" -o ${OBJECTDIR}/_ext/1899928523/Tick.o ../Source/c/Stacks/TcpIp/Tick.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UART.o: ../Source/c/Stacks/TcpIp/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UART.o.d" -o ${OBJECTDIR}/_ext/1899928523/UART.o ../Source/c/Stacks/TcpIp/UART.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o: ../Source/c/Stacks/TcpIp/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o.d" -o ${OBJECTDIR}/_ext/1899928523/UART2TCPBridge.o ../Source/c/Stacks/TcpIp/UART2TCPBridge.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UDP.o: ../Source/c/Stacks/TcpIp/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UDP.o.d" -o ${OBJECTDIR}/_ext/1899928523/UDP.o ../Source/c/Stacks/TcpIp/UDP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o: ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1899928523/UDPPerformanceTest.o ../Source/c/Stacks/TcpIp/UDPPerformanceTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o: ../Source/c/Stacks/TcpIp/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfHelper.o ../Source/c/Stacks/TcpIp/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o: ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfLinkLocal.o ../Source/c/Stacks/TcpIp/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o: ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1899928523" 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/_ext/1899928523/ZeroconfMulticastDNS.o ../Source/c/Stacks/TcpIp/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/fsio.o: ../Source/c/Stacks/Usb/fsio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/fsio.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/fsio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/fsio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/fsio.o.d" -o ${OBJECTDIR}/_ext/395789329/fsio.o ../Source/c/Stacks/Usb/fsio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_config.o: ../Source/c/Stacks/Usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_config.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_config.o ../Source/c/Stacks/Usb/usb_config.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host.o: ../Source/c/Stacks/Usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host.o ../Source/c/Stacks/Usb/usb_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host_msd.o: ../Source/c/Stacks/Usb/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host_msd.o ../Source/c/Stacks/Usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o: ../Source/c/Stacks/Usb/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/395789329" 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/395789329/usb_host_msd_scsi.o ../Source/c/Stacks/Usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/adc_task.o: ../Source/c/Tasks/adc_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/adc_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/adc_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/adc_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/adc_task.o.d" -o ${OBJECTDIR}/_ext/779311843/adc_task.o ../Source/c/Tasks/adc_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/app_task.o: ../Source/c/Tasks/app_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/app_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/app_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/app_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/app_task.o.d" -o ${OBJECTDIR}/_ext/779311843/app_task.o ../Source/c/Tasks/app_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/com_task.o: ../Source/c/Tasks/com_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/com_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/com_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/com_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/com_task.o.d" -o ${OBJECTDIR}/_ext/779311843/com_task.o ../Source/c/Tasks/com_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/led_task.o: ../Source/c/Tasks/led_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/led_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/led_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/led_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/led_task.o.d" -o ${OBJECTDIR}/_ext/779311843/led_task.o ../Source/c/Tasks/led_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/mcp23008_task.o: ../Source/c/Tasks/mcp23008_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/mcp23008_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/mcp23008_task.o.d" -o ${OBJECTDIR}/_ext/779311843/mcp23008_task.o ../Source/c/Tasks/mcp23008_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/tcpip_task.o: ../Source/c/Tasks/tcpip_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/tcpip_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/tcpip_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/tcpip_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/tcpip_task.o.d" -o ${OBJECTDIR}/_ext/779311843/tcpip_task.o ../Source/c/Tasks/tcpip_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/test_task.o: ../Source/c/Tasks/test_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/test_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/test_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/test_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/test_task.o.d" -o ${OBJECTDIR}/_ext/779311843/test_task.o ../Source/c/Tasks/test_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/779311843/usb_task.o: ../Source/c/Tasks/usb_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779311843" 
	@${RM} ${OBJECTDIR}/_ext/779311843/usb_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/779311843/usb_task.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779311843/usb_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -D_SUPPRESS_PLIB_WARNING -I"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include" -I"../Source/h/Bsp" -I"../Source/h/Bsp/_ETH" -I"../Source/h/Bsp/_SD" -I"../Source/h/Com" -I"../Source/h/Drivers" -I"../Source/h/Main" -I"../Source/h/Sched" -I"../Source/h/Stacks/Sd" -I"../Source/h/Stacks/TcpIp" -I"../Source/h/Stacks/TcpIpConfig" -I"../Source/h/Stacks/Usb" -I"../Source/h/Tasks" -MMD -MF "${OBJECTDIR}/_ext/779311843/usb_task.o.d" -o ${OBJECTDIR}/_ext/779311843/usb_task.o ../Source/c/Tasks/usb_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../Source/_Linker/UsbHostBoot/app_32MX795F512L.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1,--defsym=_min_heap_size=5000,-L"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include",-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../Source/_Linker/UsbHostBoot/app_32MX795F512L.ld ../../Boot/DemoPic32Boot.X/dist/default/production/DemoPic32Boot.X.production.hex
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=5000,-L"C:/Program Files (x86)/Microchip/xc32/v1.32/pic32mx/include",-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo "Creating unified hex file"
	@"C:/Program Files (x86)/Microchip/MPLABX/v5.30/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files (x86)/Microchip/MPLABX/v5.30/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/Pic32DemoApp.X.${IMAGE_TYPE}.hex ../../Boot/DemoPic32Boot.X/dist/default/production/DemoPic32Boot.X.production.hex -odist/${CND_CONF}/production/Pic32DemoApp.X.production.unified.hex

endif


# Subprojects
.build-subprojects:
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
	cd /D ../../Boot/DemoPic32Boot.X && ${MAKE}  -f Makefile CONF=default TYPE_IMAGE=DEBUG_RUN
else
	cd /D ../../Boot/DemoPic32Boot.X && ${MAKE}  -f Makefile CONF=default
endif


# Subprojects
.clean-subprojects:
	cd /D ../../Boot/DemoPic32Boot.X && rm -rf "build/default" "dist/default"

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
