# Digital-System-with-FPGA-Based-Realization-for-Temperature-Sensor

## Overview:
This project aims to design a digital system incorporating FPGA-based realization for an accelerometer/temperature sensor data-based intensity control and color-code application. The system utilizes Pulse Width Modulation (PWM) technique for intensity control of tri-color LEDs based on the input data from the accelerometer or temperature sensor. The design includes interfacing with accelerometer sensor via SPI protocol and temperature sensor via I2C protocol. Additionally, the system displays the values on time-multiplexed seven-segment displays or through a VGA port on the FPGA board.

## Requirements:
- FPGA Board
- Accelerometer Sensor
- Temperature Sensor
- Tri-color LEDs
- Seven-Segment Displays
- VGA Port

## Functionality:
1. **Accelerometer/Temperature Sensor Data Input:**
   - The system receives data from the accelerometer sensor via SPI protocol or temperature sensor via I2C protocol.

2. **Pulse Width Modulation (PWM) Intensity Control:**
   - Intensity level of tri-color LEDs is controlled using PWM technique based on the input data.
   - Different intensity levels and color codes are assigned for various ranges of values in the x, y, and z-axes for the accelerometer or temperature register values for the temperature sensor.

3. **Display Output:**
   - The values are displayed either on time-multiplexed seven-segment displays or through a VGA port on the FPGA board.
   - Alternatively, the values can be displayed on a monitor interfaced with FPGA via the VGA port.

4. **Simulation:**
   - The system includes simulation of pulse width modulation and accelerometer/temperature sensor data.

## Project Structure:
- **Main Module:**
  - Handles overall system integration and communication with peripheral modules.
  
- **Accelerometer Interface Module:**
  - Manages communication with the accelerometer sensor using SPI protocol.
  
- **Temperature Sensor Interface Module:**
  - Manages communication with the temperature sensor using I2C protocol.
  
- **PWM Control Module:**
  - Implements the Pulse Width Modulation technique for controlling LED intensity.
  
- **Color Coding Module:**
  - Assigns different colors to LEDs based on the input data range.
  
- **Display Interface Module:**
  - Controls the output display either on seven-segment displays or through VGA port.
  
- **Simulation Module:**
  - Handles simulation of PWM and sensor data.

## How to Use:
1. Connect the FPGA board with the accelerometer and temperature sensor.
2. Upload the FPGA design code onto the board.
3. Configure the system parameters such as data ranges and color codes.
4. Run the system and observe the LED intensity and color changes based on sensor data.
5. Check the output display either on seven-segment displays or through a VGA monitor.
