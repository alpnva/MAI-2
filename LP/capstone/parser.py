familytree = open("FamilyTree.ged", "r", encoding="utf-8-sig")  # открываем файл, который нам надо преобразовать
task = open("task.pl", "w", encoding="utf-8-sig")  # все, что будем преобразовывать, затем запишем в task1.pl
task.write(":- encoding(utf8).\n\n")  # чтобы пролог воспринимал русский язык

sex = []  # будем разграничивать правила записи для мужчин и женщин
person = {}  # для сопоставления людей с их ID
children = {}  # для сопоставления детей с их родителями
ID = 0
lines_after_16 = familytree.readlines()[16:]
for line in lines_after_16:
    if "INDI" in line:  # для нахождения человека
        ID = line[5:10]
    elif "NAME" in line:
        name = line[7:-1]
        person[ID] = "'" + name[:-1][:-1] + "'"
    elif "SEX" in line:
        if "F" in line:
            task.write("female(" + person[ID] + ").\n")
        else:
            task.write("male(" + person[ID] + ").\n")
    elif "FAM" in line:  # ищем семью
        dad = 0
        mum = 0
        if "HUSB" in line:
            dad = line[2][2:-1]
        if "WIFE" in line:
            mum = line[2][2:-1]
        while "_UID" not in line:
            if "CHIL" in line:  # находим ребенка
                child_id = line[2][2:-1]
                children[person[child_id]] = set()
                if dad != 0:  # если нет никакой информации об отце, то не пишем его
                    children[person[child_id]].add(person[dad])
                if mum != 0:  # если нет никакой информации о матери, то не пишем ее
                    children[person[child_id]].add(person[dad])

task.write("\n")

task.write("%child(child, parent)\n")
for child, parents in children.items():
    for parent in parents:
        task.write("child(" + child + ", " + parent + ").\n")
task.write("\n")

familytree.close()
task.close()
