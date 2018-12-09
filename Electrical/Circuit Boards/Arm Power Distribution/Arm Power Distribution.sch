EESchema Schematic File Version 2
LIBS:connectors
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Arm Power Distribution-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1650 1000 5050 1000
Wire Wire Line
	1650 1200 1650 1000
Wire Wire Line
	2300 1000 2300 1200
Wire Wire Line
	3000 1000 3000 1200
Connection ~ 2300 1000
Wire Wire Line
	3700 1000 3700 1200
Connection ~ 3000 1000
Wire Wire Line
	4400 1000 4400 1200
Connection ~ 3700 1000
Wire Wire Line
	1650 1350 1650 1550
Wire Wire Line
	1650 1550 5050 1550
Wire Wire Line
	2300 1550 2300 1350
Wire Wire Line
	3000 1550 3000 1350
Connection ~ 2300 1550
Wire Wire Line
	3700 1550 3700 1350
Connection ~ 3000 1550
Wire Wire Line
	4400 1550 4400 1350
Connection ~ 3700 1550
Connection ~ 4400 1000
Connection ~ 4400 1550
Wire Wire Line
	5050 1000 5050 1200
Connection ~ 5050 1000
Wire Wire Line
	5050 1550 5050 1350
Connection ~ 5050 1550
Wire Wire Line
	5050 1200 5250 1200
Wire Wire Line
	5050 1350 5250 1350
Wire Wire Line
	2350 1900 5100 1900
Wire Wire Line
	3700 1900 3700 2100
Wire Wire Line
	4400 1900 4400 2100
Wire Wire Line
	3700 2450 3700 2250
Wire Wire Line
	4400 2450 4400 2250
Connection ~ 4400 1900
Connection ~ 4400 2450
Wire Wire Line
	5100 1900 5100 2100
Connection ~ 5100 1900
Wire Wire Line
	5100 2450 5100 2250
Connection ~ 5100 2450
Wire Wire Line
	5100 2100 5250 2100
Wire Wire Line
	5100 2250 5250 2250
$Comp
L XT60-F J1
U 1 1 5C0A1F76
P 1300 1200
F 0 "J1" H 1300 1300 60  0000 C CNN
F 1 "XT60-F" H 1300 950 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 1300 950 60  0001 C CNN
F 3 "" H 1300 950 60  0001 C CNN
	1    1300 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J2
U 1 1 5C0A1FE7
P 1950 1200
F 0 "J2" H 1950 1300 60  0000 C CNN
F 1 "XT60-F" H 1950 950 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 1950 950 60  0001 C CNN
F 3 "" H 1950 950 60  0001 C CNN
	1    1950 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J3
U 1 1 5C0A2006
P 2650 1200
F 0 "J3" H 2650 1300 60  0000 C CNN
F 1 "XT60-F" H 2650 950 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 2650 950 60  0001 C CNN
F 3 "" H 2650 950 60  0001 C CNN
	1    2650 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J4
U 1 1 5C0A2049
P 3350 1200
F 0 "J4" H 3350 1300 60  0000 C CNN
F 1 "XT60-F" H 3350 950 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 3350 950 60  0001 C CNN
F 3 "" H 3350 950 60  0001 C CNN
	1    3350 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J6
U 1 1 5C0A208A
P 4050 1200
F 0 "J6" H 4050 1300 60  0000 C CNN
F 1 "XT60-F" H 4050 950 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 4050 950 60  0001 C CNN
F 3 "" H 4050 950 60  0001 C CNN
	1    4050 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-M J9
U 1 1 5C0A20CB
P 5550 1200
F 0 "J9" H 5600 1300 60  0000 C CNN
F 1 "XT60-M" H 5600 950 60  0000 C CNN
F 2 "Power Connectors:XT60-M" H 5600 950 60  0001 C CNN
F 3 "" H 5600 950 60  0001 C CNN
	1    5550 1200
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J5
U 1 1 5C0A21D8
P 3350 2100
F 0 "J5" H 3350 2200 60  0000 C CNN
F 1 "XT60-F" H 3350 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 3350 1850 60  0001 C CNN
F 3 "" H 3350 1850 60  0001 C CNN
	1    3350 2100
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J7
U 1 1 5C0A21DE
P 4050 2100
F 0 "J7" H 4050 2200 60  0000 C CNN
F 1 "XT60-F" H 4050 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 4050 1850 60  0001 C CNN
F 3 "" H 4050 1850 60  0001 C CNN
	1    4050 2100
	1    0    0    -1  
$EndComp
$Comp
L XT60-M J10
U 1 1 5C0A2273
P 5550 2100
F 0 "J10" H 5600 2200 60  0000 C CNN
F 1 "XT60-M" H 5600 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-M" H 5600 1850 60  0001 C CNN
F 3 "" H 5600 1850 60  0001 C CNN
	1    5550 2100
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J8
U 1 1 5C0A2765
P 4750 2100
F 0 "J8" H 4750 2200 60  0000 C CNN
F 1 "XT60-F" H 4750 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 4750 1850 60  0001 C CNN
F 3 "" H 4750 1850 60  0001 C CNN
	1    4750 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2450 5100 2450
Text Label 5050 1000 0    60   ~ 0
LP0
Text Label 5050 1550 0    60   ~ 0
LP12
Text Label 5100 1900 0    60   ~ 0
HP0
Text Label 5100 2450 0    60   ~ 0
HP22
Wire Wire Line
	2350 1900 2350 2100
Wire Wire Line
	2350 2450 2350 2250
Connection ~ 2350 1900
Connection ~ 2350 2450
$Comp
L XT60-F J12
U 1 1 5C0A3BDB
P 2000 2100
F 0 "J12" H 2000 2200 60  0000 C CNN
F 1 "XT60-F" H 2000 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 2000 1850 60  0001 C CNN
F 3 "" H 2000 1850 60  0001 C CNN
	1    2000 2100
	1    0    0    -1  
$EndComp
$Comp
L XT60-F J13
U 1 1 5C0A3BE1
P 2700 2100
F 0 "J13" H 2700 2200 60  0000 C CNN
F 1 "XT60-F" H 2700 1850 60  0000 C CNN
F 2 "Power Connectors:XT60-F" H 2700 1850 60  0001 C CNN
F 3 "" H 2700 1850 60  0001 C CNN
	1    2700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2250 3050 2450
Connection ~ 3050 2450
Wire Wire Line
	3050 1900 3050 2100
Connection ~ 3050 1900
Connection ~ 3700 1900
Connection ~ 3700 2450
$EndSCHEMATC