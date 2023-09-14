vlib work
vlog Design.v test_bench.sv  +cover
vsim -voptargs=+acc work.test_bench -cover
add wave *
coverage save test_bench.ucdb -onexit -du Design
#quit -sim
#vcover report test_bench.ucdb -all -annotate -details  -output coverage.txt
