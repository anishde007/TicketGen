
# Ticket Generator System (FSM-Based with Coin Input)

## Overview
This project implements a **Finite State Machine (FSM)** based ticket generator system on the **Basys 3** FPGA board. The system accepts coins (nickels, dimes, and quarters) as inputs and correctly calculates and displays the change on a 7-segment display. The machine simulates a ticket vending system where a user inserts coins and receives a ticket once 25 cents is inserted. Any extra change is displayed after the ticket is generated.

## Features
- Accepts **nickel (5 cents)**, **dime (10 cents)**, and **quarter (25 cents)** as inputs.
- Displays **remaining change** if more than 25 cents is inserted.
- Implements a **state machine** to track coin inputs and transition between states (idle, 5 cents, 10 cents, etc.).
- Uses a **7-segment display** to show the change and state information dynamically.
- Incorporates a **Binary to BCD conversion** for decimal display on the 7-segment.

## Table of Contents
- [Project Structure](#project-structure)
- [Hardware Requirements](#hardware-requirements)
- [Software Requirements](#software-requirements)
- [FSM Design](#fsm-design)
- [Modules](#modules)
- [Setup](#setup)
- [Simulation](#simulation)
- [License](#license)

## Project Structure

```
/Ticket-Generator-System
│
├── /src                       # Source code files (Verilog)
│   ├── state_machine.v         # FSM implementation
│   ├── seg7_control.v          # 7-segment display driver
│   ├── conv2bcd.v              # Binary to BCD converter
│   ├── debounce.v              # Debounce logic for button input
│   └── top_module.v            # Top-level module connecting all components
│
├── /contraints               # Ports
│   └── basys.xdc               # For this particular board
│
└── README.md                  # Project readme file
```

## Hardware Requirements
- **Basys 3 FPGA board**: The project was implemented and tested on the Basys 3 FPGA board.
- **7-segment display**: Used to display coin values and change (present on the board).
- **Push buttons**: Simulate coin inputs (nickel, dime, quarter). Also present on the board.
- **LEDs**: For visual feedback on coin insertion and change returned (present on the board).

## Software Requirements
- **Xilinx Vivado**: For synthesizing and implementing the Verilog code on the Basys 3 board.
  
## FSM Design
The system operates using a **Finite State Machine (FSM)** with the following states:
- **Idle (0 cents)**: Waiting for coin input.
- **5 cents, 10 cents, 15 cents, 20 cents**: Intermediate states, accumulating the coin values.
- **25 cents (Ticket)**: Ticket is generated, waiting for change to be returned if necessary.
- **Change return**: Displays any extra change.

## Modules

### 1. **state_machine.v**
Implements the FSM logic, transitions between coin states (5c, 10c, 15c, 20c, 25c), and calculates the change when necessary.

### 2. **conv2bcd.v**
Converts the binary coin count or change value into **Binary-Coded Decimal (BCD)** format, so it can be displayed on a 7-segment display.

### 3. **seg7_control.v**
Handles the 7-segment display multiplexing to show the current state or change in a rolling fashion across four digits.

### 4. **debounce.v**
Debounces the input signals from the push buttons to ensure stable transitions when simulating coin inputs.

### 5. **top_module.v**
Integrates all modules, connecting the FSM, 7-segment driver, and debounce logic to form the complete ticket generator system.

## Setup

### 1. **Clone the Repository**
```bash
git clone https://github.com/anishde007/TicketGen.git
cd TicketGen
```

### 2. **Open in Vivado**
- Open Vivado and create a new project.
- Add the Verilog files from the `src` directory to the project.
- Set up your Basys 3 board as the target device.

### 3. **Synthesize and Implement**
- Run synthesis and implementation for the project.
- Generate the bitstream and program the Basys 3 board.

### 4. **Running the System**
- Use the push buttons to simulate coin insertion (nickel, dime, quarter).
- Watch the 7-segment display to observe the coin accumulation, ticket generation, and change display.


## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
