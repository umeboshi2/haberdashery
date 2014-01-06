import os, sys

rgb = file('/etc/X11/rgb.txt')

def make_hexcolor(r, g, b):
    hexcolor = ''
    for c in r, g, b:
        num = int(c)
        if not num:
            hexcolor += '00'
            continue
        hc = hex(num)[2:]
        if len(hc) == 1:
            hc = '0' + hc
        hexcolor += hc
    return hexcolor

colors = []
for line in rgb:
    if line.startswith('!'):
        continue
    parts = line.split()
    if len(parts) == 4:
        r, g, b, name = parts
        #colors.append(parts)
        hexcolor = make_hexcolor(r, g, b)
        sass_line = '$color-%s: #%s;\n' % (name, hexcolor)
        colors.append(sass_line)
        
    
out = file('_colors.scss', 'w')
for line in colors:
    out.write(line)
out.close()
