/**
 * Marlin 3D Printer Firmware
 * Copyright (c) 2020 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
 *
 * Based on Sprinter and grbl.
 * Copyright (c) 2011 Camiel Gubbels / Erik van der Zalm
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 */
#pragma once

#if HOTENDS > 1 || E_STEPPERS > 1
  #error "Creality RAMPS supports up to 1 hotends / E steppers."
#endif

#define BOARD_INFO_NAME "Creality v2.2.1 (RAMPS 1.3)"

/**
 * WARNING!
 * Adjust Vref of E1 (new Z2) and Z stepper drivers to avoid overheating 42-34 stepper motors
 * Vref for TMC2208: https://www.youmaketech.com/how-to-adjust-stepper-motor-currents-on-ender-3-pro-v2/
 */

// use E1 stepper as Z2 to enable G34
#define E1_STEP_PIN                         -1
#define E1_DIR_PIN                          -1
#define E1_ENABLE_PIN                       -1
#define E1_CS_PIN                           -1

#define Z2_STEP_PIN                         36
#define Z2_DIR_PIN                          34
#define Z2_ENABLE_PIN                       30
#define Z2_CS_PIN                           44

#define SD_DETECT_PIN                       49

#include "pins_RAMPS.h"