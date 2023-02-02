;MACRO SIMPLE PRINT
    .MACRO PRINT
        .IF :0 < 1
            .ERROR "MACRO PRINT, FALTA PARAMETRO"
        .ELSE
            ;LDX #<:1
            ;LDY #>:1
            ;JSR $C642
            LDX #:1*16
            LDA #$09
            STA ICCOM,X
            LDA # <:2
            STA ICBADR,X
            LDA # >:2
            STA ICBADR+1,X
            LDA #$FF
            STA ICBLEN,X
            LDA #$00
            STA ICBLEN+1,X
            JSR CIO
        .ENDIF
    .ENDM
;MACRO POKE
    .MACRO POKE
        .IF :0 < 2
            .ERROR "MACRO POKE, FALTA PARAMETRO"
        .ELSE
            LDA #:2
            STA :1
        .ENDIF
    .ENDM
;MACRO OPEN 
    .MACRO OPEN
        .IF :0<4
            .ERROR "ERROR MACRO, FALTA PARAMETRO"
        .ELSE
            LDX #:1*16
            .IF :2 <7
                LDA #$03
            .ELSE
                LDA #$07
            .ENDIF
            STA ICCOM,X
            LDA #:2
            STA ICAUX1,X
            LDA #:3
            STA ICAUX2,X
            LDA #<:4
            STA ICBADR,X
            LDA #>:4
            STA ICBADR+1,X
            JSR CIO
        .ENDIF
    .ENDM
;MACRO CLOSE
    .MACRO CLOSE
        .IF :0 <1
            .ERROR "ERROR MACRO, FALTAN PARAMETROS"
        .ELSE
            LDX #:1*16
            LDA #CCLOSE
            STA ICCOM,X
            JSR CIO
        .ENDIF
    .ENDM
;MACRO BGET
    .MACRO BGET
        .IF :0 <3
            .ERROR "ERROR MACRO, FALTAN PARAMETROS"
        .ELSE
            LDX #:1*16
            LDA #$07
            STA ICCOM,X
            LDA # <:2
            STA ICBADR,X
            LDA # >:2
            STA ICBADR+1,X
            LDA :3
            STA ICBLEN,X
            LDA :3+1
            STA ICBLEN+1,X
            JSR CIO
        .ENDIF
    .ENDM
;MACRO DETENGO
    .MACRO DETENGO
        LDA #$40
        STA 710
        JMP *
    .ENDM