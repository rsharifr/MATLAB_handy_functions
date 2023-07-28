function ha = tightSubplot(n,m,B,U,L,R,px,py)
clf
if nargin<8
    B = 0.1; % Bottom margin
    U = 0.1; % Top margin
    L = 0.1; % left margin
    R = 0.1; % Right margin
    px = 0.05; % horizontal padding
    py = 0.05; % vertical padding
end

w = (1-L-R-(m-1)*px)/m;  % width of each plot
h = (1-U-B-(n-1)*py)/n; % height of each plot
for i = 1:n
    for j = 1:m
        x = L + (j-1)*(w+px);
        y = B + (n-i)*(h+py); % top plot has index 1 to be consistant with suplot
        ha(i,j) = axes('Position',[x, y, w, h],'ActivePositionProperty','position');
    end
end

% ha = ha';
