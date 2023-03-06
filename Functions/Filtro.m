function [Filtered_signal]=Filtro(Signal)
 
for i=5:13
    order = 3;
     framelen = 71;
    x=Signal(:,i);
    b = sgolay(order,framelen);
    ycenter = conv(x,b((framelen+1)/2,:),'valid');
    ybegin = b(end:-1:(framelen+3)/2,:) * x(framelen:-1:1);
    yend = b((framelen-1)/2:-1:1,:) * x(end:-1:end-(framelen-1));
    y = [ybegin; ycenter; yend];
    Filtered_signal(:,i)=y;
end 
Filtered_signal(:,1)=Signal(:,1);
Filtered_signal(:,2)=Signal(:,2);
Filtered_signal(:,3)=Signal(:,3);
Filtered_signal(:,4)=Signal(:,4);
