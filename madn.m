function out = madn(X,dim)
if ~exist('dim','var')
    out = 1.4826 * mad(X,1);
else
    out = 1.4826 * mad(X,1,dim);
end

