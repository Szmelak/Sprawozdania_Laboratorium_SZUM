% Sprawozdanie.1 Arkadiusz Szmelcuch 36780 AiR
% Po stworzeniu symulacji w terminalach, otrzymujemy ,,topic''. Przechowywane w nim są informacje o położeniu żółwia. 
% Następnie w programie Matlab pobieramy informacje z ,,topic" i tworzymy wizualizację. Poniżej kod programu.

while(1)
    zolw = rossubscriber('/turtle1/pose');
    dane = receive(zolw);
    x = dane.X;
    y = dane.Y;
    plot(x,y,'x')
    xlim([0 11]);
    ylim([0 11]);
end
