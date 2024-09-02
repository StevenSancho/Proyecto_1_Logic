`timescale 1ns / 1ps

module gray_decoder_system_tb;

    // Señales de testbench
    logic [3:0] gray_in;    // Entrada código Gray
    logic [3:0] led;        // Salida a los LEDs
    logic [6:0] seg;        // Salida al display de 7 segmentos
    logic [1:0] an;         // Salida a los ánodos de los displays

    // Instancia del módulo bajo prueba (DUT)
    gray_decoder_system DUT (
        .gray_in(gray_in),
        .led(led),
        .seg(seg),
        .an(an)
    );

    // Generación de estímulos
    initial begin
        // Inicialización de la señal de entrada
        gray_in = 4'b0000;

        // Probar todas las combinaciones posibles de código Gray
        for (int i = 0; i < 16; i++) begin
            gray_in = i[3:0];
            #20; // Esperar 20 ns entre cada cambio para observar las salidas
        end

        // Finalizar la simulación
        $finish;
    end

    // Monitoreo de resultados
    initial begin
        $monitor("Tiempo: %0dns, Gray: %b, LEDs: %b, 7Seg: %b, Anodos: %b", 
                 $time, gray_in, led, seg, an);
    end

    // Generación de archivo VCD para visualización de formas de onda
    initial begin
        $dumpfile("Resultados.vcd");
        $dumpvars(0, gray_decoder_system_tb);
    end
endmodule
