module(
    input logic [3:0] bin_in, //ENtrada binaria
    output logic [6:0] seg //Salida al display de 7 seg
);
    //Asignaciones al 7 segmentos
    //Implementacion por medio de ecuaciones buleanas, asiganacion al 7 seg, desde el seg 0 (a) al seg 6 (g)

    assign seg[0] = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & bin_in[0] | // 0
                    ~bin_in[3] & bin_in[2] & ~bin_in[1] & ~bin_in[0] | // 2
                    bin_in[3] & ~bin_in[2] & bin_in[1] & bin_in[0] |  // 8
                    bin_in[3] & bin_in[2] & ~bin_in[1] & bin_in[0];   // 9

    assign seg[1] = ~bin_in[3] & bin_in[2] & ~bin_in[1] & bin_in[0] | // 1
                    bin_in[2] & bin_in[1] & ~bin_in[0] |               // 2,3
                    bin_in[3] & bin_in[2] & ~bin_in[1] & bin_in[0] |   // 7
                    bin_in[3] & bin_in[2] & bin_in[1] & ~bin_in[0];    // 9

    assign seg[2] = ~bin_in[3] & ~bin_in[2] & bin_in[1] & ~bin_in[0] | // 0
                    bin_in[3] & bin_in[2] & ~bin_in[1] & ~bin_in[0] |  // 1
                    bin_in[3] & bin_in[2] & bin_in[1] & ~bin_in[0];    // 7

    assign seg[3] = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & bin_in[0] | // 0
                    ~bin_in[3] & bin_in[2] & ~bin_in[1] & ~bin_in[0] | // 2
                    bin_in[2] & bin_in[1] & bin_in[0] |               // 3,7
                    bin_in[3] & ~bin_in[2] & bin_in[1] & ~bin_in[0];  // 8

    assign seg[4] = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & bin_in[0] | // 0
                    ~bin_in[3] & ~bin_in[2] & bin_in[0] & ~bin_in[0] | // 4
                    bin_in[3] & ~bin_in[2] & ~bin_in[1] & bin_in[0];   // 9

    assign seg[5] = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & bin_in[0] | // 0
                    ~bin_in[3] & bin_in[2] & ~bin_in[1] & ~bin_in[0] | // 2
                    ~bin_in[3] & bin_in[1] & bin_in[0] |              // 3,7
                    bin_in[3] & ~bin_in[2] & bin_in[1] & ~bin_in[0];  // 8

    assign seg[6] = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & ~bin_in[0] | // 0
                    ~bin_in[3] & ~bin_in[2] & bin_in[1] & bin_in[0] |   // 4
                    bin_in[3] & bin_in[2] & ~bin_in[1] & ~bin_in[0];    // 8
endmodule 