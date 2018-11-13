while(1)
    zolw = rossubscriber('/turtle1/pose');
    dane = receive(zolw);
    x = dane.X;
    y = dane.Y;
    plot(x,y,'x')
    xlim([0 11]);
    ylim([0 11]);
end
