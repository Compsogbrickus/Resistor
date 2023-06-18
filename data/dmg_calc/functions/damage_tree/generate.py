begin = 1
bits = 6
amount = pow(2, bits)

def write_tree(mid, file, path):
    with open("{}.mcfunction".format(file), "w") as function:
        function.write("execute if score @s calc.dmg matches ..{} run function dmg_calc:damage_tree/{}0\n".format(int(mid), path))
        function.write("execute if score @s calc.dmg matches {}.. run function dmg_calc:damage_tree/{}1".format(int(mid + 1), path))

def write_end(damage, path):
    with open("{}.mcfunction".format(path), "w") as function:
        function.write("damage @s {} dmg_calc:final_damage".format(damage))

for i in range(begin, amount):
    start = begin
    end = amount
    path = "base"
    for j in range(bits):
        mid = (start + end) / 2
        if path == "base":
            path = ""
            write_tree(mid, "base", path)
        else:
            write_tree(mid, path, path)
        if i < mid:
            end = mid
            path += "0"
        else:
            start = mid
            path += "1"
    write_end(i, path)