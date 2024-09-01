# Proyecto_1_Logic
1.	Resumen
En este proyecto se realiza una conversión de código de gray, de cuatro bits, a una representación binaria y decimal, mediante el uso de una FPGA, utilizando el lenguaje de System Verilog, aplicando lógica booleana y las debidas conexiones entre componentes

2.	Introducción
En este documento se pretende demostrar, aplicando lógica booleana, representar un código de gray de cuatro bits a una forma binaria utilizando cuatro LEDs de la FPGA utilizada, generando un código decodificador, el cual traduce la entrada del código gray a una representación binaria, además, se representa de una forma decimal el número ingresado mediante el uso de dos unidades de 7 segmentos, los cuales necesitan una decodificación de la representación binaria a su forma decimal, teniendo presente las conexiones para el debido uso de ambos 7 segmentos.

3.	Solución teórica
Primeramente, es necesario definir un código que represente la decodificación de la entrada de código gray para así poder tener una representación binaria donde mediante el uso de la FPGA dar la representación de cuatro bits de la representación binaria. En este caso solo se utilizaron compuertas “AND”, “OR” y “NOT” cuando fuera necesario. Como la entrada del código gray y la salida resultante de forma binaria son ambas de cuatro bits, se utiliza álgebra booleana para la representación de cada bit, para el bit en la posición 3(MSB) es igual para ambos casos, por lo tanto, esa posición se mantiene, para el bit en la posición 2(B2), se debe aplicar álgebra booleana donde B2=A’B+AB’, donde A y B es la representación de las entradas en las posiciones 3 y 2 del código gray.

![Representación del bit en la posición 2](Imagenes/TV_B2.png)

Para los bits en la posición 1 y 0 también se aplica el álgebra booleana necesaria para poder obtener cada valor. En ambos casos se utilizan los valores establecidos en las posiciones anteriores(B3 y B2). Seguidamente la representación en tablas de verdad de los bits B1 y B0.

![Representación del bit en la posición 1](Imagenes/TV_12.png)

![Representación del bit en la posición 0](Imagenes/TV_B0.png)

Seguidamente, teniendo presente el álgebra necesaria para cada posición de la forma binaria, se aplica un código el cual traducirá la entrada digitada a una representación con LEDs de la FPGA, mediante el uso del decodificador anteriormente demostrado.
