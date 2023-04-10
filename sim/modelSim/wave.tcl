add wave -divider {uart_test}
add wave -noupdate -expand -group uart_test -radix hex \
{/uart_rx_tb/clk}\
{/uart_rx_tb/rst_n}\
add wave -divider {}

add wave -divider {uart_rx}\
{/uart_rx_tb/data_i}\
{/uart_rx_tb/data_o}\
add wave -divider {}
