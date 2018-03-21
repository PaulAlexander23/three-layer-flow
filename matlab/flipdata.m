

files = dir();

for j = 1:length(files)
    if contains(files(j).name,".mat")
        load(files(j).name)
        h = [flipud(h(1:end/2,:)); flipud(h(end/2+1:end,:))];
        display(files(j).name);
        save(files(j).name)
    end
end
