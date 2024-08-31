module bin_to_7seg(
    input logic [3:0] bin_in,     // Entrada binaria (4 bits)
    output logic [6:0] seg,       // Salida común para ambos displays
    output logic anode0,          // Control del ánodo para el display de unidades
    output logic anode1           // Control del ánodo para el display de decenas
);

    logic [3:0] units;  // Unidades (cifra más baja)
    logic [3:0] tens;   // Decenas (cifra más alta)
    
    // Lógica para decenas y unidades
    assign tens = (bin_in >= 10) ? 1 : 0;  // Si el número es >= 10, la decena es 1
    assign units = (bin_in >= 10) ? (bin_in - 10) : bin_in;  // Si el número es >= 10, unidades = bin_in - 10

    // Control de los anodos mediante lógica booleana pura
    assign anode0 = ~(bin_in >= 10);  // Si el número es menor a 10, solo el display de unidades está activo
    assign anode1 = (bin_in >= 10);   // Si el número es 10 o más, solo el display de decenas está activo

    // Lógica para el display de 7 segmentos usando el valor de unidades
    assign seg[0] = ~units[3] & ~units[2] & ~units[1] & units[0] | 
                    ~units[3] & units[2] & ~units[1] & ~units[0] | 
                    units[3] & ~units[2] & units[1] & units[0] |  
                    units[3] & units[2] & ~units[1] & units[0];   

    assign seg[1] = ~units[3] & units[2] & ~units[1] & units[0] | 
                    units[2] & units[1] & ~units[0] |               
                    units[3] & units[2] & ~units[1] & units[0] |   
                    units[3] & units[2] & units[1] & ~units[0];    

    assign seg[2] = ~units[3] & ~units[2] & units[1] & ~units[0] | 
                    units[3] & units[2] & ~units[1] & ~units[0] |  
                    units[3] & units[2] & units[1] & ~units[0];    

    assign seg[3] = ~units[3] & ~units[2] & ~units[1] & units[0] | 
                    ~units[3] & units[2] & ~units[1] & ~units[0] | 
                    units[2] & units[1] & units[0] |               
                    units[3] & ~units[2] & units[1] & ~units[0];  

    assign seg[4] = ~units[3] & ~units[2] & ~units[1] & units[0] | 
                    ~units[3] & ~units[2] & units[0] & ~units[0] | 
                    units[3] & ~units[2] & ~units[1] & units[0];   

    assign seg[5] = ~units[3] & ~units[2] & ~units[1] & units[0] | 
                    ~units[3] & units[2] & ~units[1] & ~units[0] | 
                    ~units[3] & units[1] & units[0] |              
                    units[3] & ~units[2] & units[1] & ~units[0];  

    assign seg[6] = ~units[3] & ~units[2] & ~units[1] & ~units[0] | 
                    ~units[3] & ~units[2] & units[1] & units[0] |   
                    units[3] & units[2] & ~units[1] & ~units[0];    

endmodule
