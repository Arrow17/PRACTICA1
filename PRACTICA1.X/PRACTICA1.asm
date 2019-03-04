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
;CLRF PORTD ; Limpia las salidas del puerto D
CLRF TRISD ; Define pines de puerto D como salidas
CLRF Aux1 ; Limpia variable  Aux1
CLRF Aux2 ; Limpia variable Aux2
MOVLW b'001100011' ; Configura registro OSCCON 
MOVWF  OSCCON

MainLoop:
;BTG PORTD,RD1 ;Toggles PORT D PIN 1 (20) invierte los valores del pin, si esta en 1 pone un 0 y viceversa
;BTG PORTD,RD2

DECFSZ PORTD,F
call Delay1
call Delay1  
CALL Delay1
call Delay1
call Delay1  
CALL Delay1    
goto MainLoop   
    

    
Delay1:
DECFSZ Aux1,1 ;Decrementa Aux1 en 1, salta siguiente instrucción si Aux1 es 0
GOTO Delay1
DECFSZ Aux2,1
GOTO Delay1
return
end
