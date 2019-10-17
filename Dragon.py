

Dragon = ['F']
Nogard = ['F']
for i in range(int(input())):
    Dragon.append(Dragon[-1] + 'L' + Nogard[-1])
    Nogard.append(Dragon[-2] + 'R' + Nogard[-1])
print(*Dragon, sep = '\n')
