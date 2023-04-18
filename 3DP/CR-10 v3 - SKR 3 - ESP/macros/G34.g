if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28  ; if not homed, home first

G30 P0 X10 Y155 Z-99999         ; Probe near left leadscrew
G30 P1 X300 Y155 Z-99999 S2     ; Probe near right leadscrew

while move.calibration.initial.deviation > 0.02  ; perform additional tramming if previous deviation was over 0.02mm
  echo "Iteration " ^ iterations + 1 ^ " - Deviation: " ^ move.calibration.initial.deviation ^ "mm"
  if iterations = 10
    abort "Iteration limit reached"
  G30 P0 X10 Y155 Z-99999         ; Probe near left leadscrew
  G30 P1 X300 Y155 Z-99999 S2     ; Probe near right leadscrew
  continue
;

echo "Final Z Deviation: " ^ move.calibration.initial.deviation ^ "mm"