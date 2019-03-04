LIST P = 18f45K50
#include<p18f45K50.inc>
    
CONFIG WDTEN = OFF ; Desabilita Watchdog
CONFIG MCLRE = ON ; habilita MCLEAR
CONFIG DEBUG = OFF ; Desabilita Debug mode
CONFIG LVP = OFF ; Desabilita Low-Voltage programming
CONFIG FOSC = INTOSCIO ; Habilita the internal oscillator
org 0 ; Sets first instruction in address 00
Aux1 EQU 0x00 ; Reserves register 0
Aux2 EQU 0x01 ; Reserves register 1

Start:
MOVLB 0x0F
CLRF PORTD
CLRF TRISD
CLRF ANSELD,1

CLRF TRISD 
CLRF Aux1 
CLRF Aux2 
MOVLW b'001100011' 
MOVWF  OSCCON

MainLoop:
DECFSZ PORTD,F
call Delay1
call Delay1  
CALL Delay1
call Delay1
call Delay1  
CALL Delay1    
goto MainLoop   
    

    
Delay1:
DECFSZ Aux1,1 
GOTO Delay1
DECFSZ Aux2,1
GOTO Delay1
return
end
