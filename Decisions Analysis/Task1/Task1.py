def compare(num1, num2):
    if num1 > num2:
        print(f"{num1} is bigger than {num2}")
    elif num1 < num2:
        print(f"{num1} is smaller than {num2}")
    else:
        print(f"{num1} is equal to {num2}")

def num_while():
    print("Hello!")
    x = 10
    while x >=2:
        print(x)
        x -= 2
    print()
    while x <10:
        x += 2
        print(x)
    print("Goodbye!")

def num_loop():
    print("Hello!")
    x = 10
    for i in range(x, 0, -2):
        print(i)
    print()
    for i in range(2, x+2, 2):
        print(i)
    print("Goodbye!")

def print_sum(num):
    total = 0
    for i in range(num+1):
        total += i
    print(total)

compare(5, 3)
print("-----------------------------------------------------------------------")
num_while()
print("-----------------------------------------------------------------------")
num_loop()
print("-----------------------------------------------------------------------")
print_sum(4)
print("-----------------------------------------------------------------------")