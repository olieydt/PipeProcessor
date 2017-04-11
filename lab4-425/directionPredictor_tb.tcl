proc AddWaves {} {
	;#Add waves we're interested in to the Wave window
    add wave -position end sim:/directionPredictor_tb/op_code_t
    add wave -position end sim:/directionPredictor_tb/branch_t
    add wave -position end sim:/directionPredictor_tb/branch_actual_t
    add wave -position end sim:/directionPredictor_tb/branch_pred_t
    add wave -position end sim:/directionPredictor_tb/pred_t
    add wave -position end sim:/directionPredictor_tb/clk

}

vlib work

;# Compile components if any
vcom directionPredictor.vhd
vcom directionPredictor_tb.vhd


;# Start simulation
vsim directionPredictor_tb

;# Generate a clock with 1ns period
#force -deposit clock 0 0 ns, 1 0.5 ns -repeat 1 ns

;# Add the waves
AddWaves

;# Run for 50 ns
run 600ns