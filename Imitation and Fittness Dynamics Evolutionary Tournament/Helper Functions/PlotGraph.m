function [] = PlotGraph(P , states)

    threshold = 0.01;

    n = size(P , 1);

    A = P;
    A(A< threshold) = 0;

    G = digraph(A);

    if ~isempty(states)
        labels = compose("(%s)" , join(string(states) , "," , 2));
    else
        labels = string(1 : n);
    end

    figure;
    clf;
    plot(G , 'Layout', 'force' , 'EdgeLabel', round(G.Edges.Weight , 3) , 'MarkerSize', 7 , 'NodeLabel', labels);

    title(sprintf("State-Transition Graph (edges >= %.2g)" , threshold))
    axis off;

end