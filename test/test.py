# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT

import random

NUM_TESTS = 1000

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    for _ in range(NUM_TESTS):
        # Set the input values you want to test
        dut.ui_in.value = random.randint(0, 3)

        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)

        
        assert dut.uo_out.value[0] == dut.ui_in.value[0] & dut.ui_in.value[1]