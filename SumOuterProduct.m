function s = SumOuterProduct(x)
    X = x * x';
    s = sum(triu(X), 'all');
end
