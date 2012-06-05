function [func] = func (a,b,c)
func = xor (b, xor(a,c));
end