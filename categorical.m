p = [0.5, 0.2, 0.1, 0.2];
n = length(p);
words = {'book', 'banana', 'apple', 'miso'};
bar(p)
h = gca;
xlabel('word', 'fontsize', 20)
ylabel('probability', 'fontsize', 20)
ylim([0 1]);
set(h, 'fontsize', 20, 'XTickLabel', words);
pause

values = rand(20,1);
for j = 1:20
  for i = 1:n
    if values(j) < sum(p(1:i))
      words{i}
      break
    endif
  endfor
endfor
