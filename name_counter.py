lines = open('blamed_file.txt', 'r').read().splitlines()
lines_count = dict()
count = 0
for line in lines:
    if (line.split()[1])[0] == '(':
        name = ((line.split()[1])[1:]).lower()
    else:
        name = ((line.split()[2])[1:]).lower()
    if name == 'amber.m@greyorange.sg':
        name = 'amber'
    elif name == 'plakshman93':
        name = 'plakshman'
    elif name == 'venkata' or name == 'p':
        name = 'harsha'
    lines_count[name] = lines_count.get(name, 0) + 1
sorted_list_ascending = sorted(lines_count.items(), key=lambda x:x[1])
for element in sorted_list_ascending:
    print element
