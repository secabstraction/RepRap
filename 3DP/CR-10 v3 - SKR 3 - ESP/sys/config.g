; Configuration file for BTT SKR3 H743 (firmware version 3)
; executed by the firmware on start-up

; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"Mender"                                 ; set printer name

; Network
M552 S1                                        ; enable network
M586 P0 S1                                     ; enable HTTP
M586 P1 S0                                     ; disable FTP
M586 P2 S0                                     ; disable Telnet

; Drives
M569 P0 S0 D3 V70                              ; physical drive 0 goes backwards, stealthchop mode
M915 P0 H70
M569 P1 S0 D3 V70                              ; physical drive 1 goes backwards, stealthchop mode
M915 P1 H70
M569 P2 S1 D3 V70                              ; physical drive 2 goes forwards, stealthchop mode
M915 P2 H70
M569 P3 S1 D3 V70                              ; physical drive 3 goes forwards, stealthchop mode
M915 P3 H70
M569 P4 S0 D2                                  ; physical drive 4 goes backwards, spreadcycle mode
M584 X0 Y1 Z2:3 E4                             ; set drive mapping
M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E400.00              ; set steps per mm
M566 X900.00 Y900.00 Z60.00 E120.00            ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z240.00 E1200.00        ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z20.00 E250.00            ; set accelerations (mm/s^2)
M906 X1200 Y1200 Z800 E1000                    ; set motor currents (mA) and motor idle factor in percent
M84 S0                                         ; Disable motor idle current reduction

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X320 Y320 Z405 S0                         ; set axis maxima, x-axis must exceed bed to account for probe offset

; Endstops
M574 X1 S1 P"xstop"                            ; configure switch-type (e.g. microswitch) endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                            ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin ystop
M574 Z1 S2                                     ; configure Z-probe endstop for low end on Z
M591 D0 P1 C"e0det" S1                         ; filament monitor connected to E0 endstop

; Z-Probe
M950 S0 C"servo0"                              ; create servo pin 0 for BLTouch
M558 P9 C"^probe" H5 F120 T6000                ; set Z probe type to bltouch and the dive height + speeds
G31 X-41 Y-15 Z2.5                             ; set Z probe nozzle offset
M557 X25:275 Y25:275 S50                       ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                               ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        ; map heated bed to heater 0
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4092  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S315                                   ; set temperature limit for heater 1 to 315C

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T50                              ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0:1                             ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S2 B57600                              ; enable support for PanelDue
M671 X-25:335 Y155:155 S3                      ; The location of the two Z axis screws
M80 C"pson"                                    ; set PS_ON active for BTT auto-shutdown relay
M501                                           ; load saved parameters from non-volatile memory
T0
