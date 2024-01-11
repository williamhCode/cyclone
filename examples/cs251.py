from cyclone.window import *
from cyclone.render import Renderer
from cyclone.timer import Timer
from cyclone.texture import Texture, RenderTexture
from cyclone.shapes import Rectangle
from cyclone.font import Font, SysFont
from cyclone.constants import *
from dataclasses import dataclass
from camera import Camera2D

Pair = tuple[int, int]


@dataclass
class SortData:
    array: list[int]
    swap: Pair
    compares: list[Pair]


def insertion_sort(array: list[int]) -> list[SortData]:
    data_list = []

    n = len(array)
    for i in range(1, n):
        j = i - 1
        while True:
            data = SortData(array.copy(), None, [])

            if j >= 0 and array[j] > array[j + 1]:
                data.compares.append((j, j + 1))
            else:
                break
            array[j], array[j + 1] = array[j + 1], array[j]

            data.swap = (j, j + 1)
            data_list.append(data)

            j -= 1

    data = SortData(array.copy(), None, [])
    data_list.append(data)

    return data_list


def selection_sort(array: list[int]) -> list[SortData]:
    data_list = []

    n = len(array)
    for i in range(n - 1):
        min_index = i
        data = SortData(array.copy(), None, [])
        for j in range(i + 1, n):
            data.compares.append((j, min_index))
            if array[j] < array[min_index]:
                min_index = j
        if i != min_index:
            data.swap = (i, min_index)
            array[i], array[min_index] = array[min_index], array[i]
        data_list.append(data)

    data = SortData(array.copy(), None, [])
    data_list.append(data)

    return data_list


def shell_sort(A: list[int], H: list[int]) -> list[SortData]:
    data_list = []

    n = len(A)
    m = len(H)
    for h in range(m):
        gap = H[h]
        for i in range(1, n):
            j = i - 1
            while True:
                data = SortData(A.copy(), None, [])
                if j >= 0 and j + gap < n:
                    data.compares.append((j, j + gap))
                    if A[j] > A[j + gap]:
                        pass
                    else:
                        if len(data.compares) > 0:
                            data_list.append(data)
                        break
                else:
                    if len(data.compares) > 0:
                        data_list.append(data)
                    break
                A[j], A[j + gap] = A[j + gap], A[j]

                data.swap = (j, j + gap)
                data_list.append(data)

                j -= gap

    data = SortData(A.copy(), None, [])
    data_list.append(data)

    return data_list


# list_a = list(range(7, 0, -1))
# list_c = list(range(7, 0, -1))
# list_e = list(range(16, 0, -1))
# sort_data = insertion_sort(list_a)
# sort_data = selection_sort(list_c)
# sort_data = shell_sort(list_e, [8, 4, 2, 1])


# for max heap
def sort_down(array: list[int], n: int, data_list: list[SortData]):
    sort_data = SortData(array.copy(), None, [])
    # swap max with end of array
    array[0], array[n] = array[n], array[0]
    sort_data.swap = (0, n)
    data_list.append(sort_data)

    sort_data = SortData(array.copy(), None, [])
    i = 0
    while True:
        _exit = False
        left = 2 * i + 1
        right = 2 * i + 2
        # if both left and right are out of range, exit
        if left >= n and right >= n:
            break

        if left >= n:
            _exit = True
            greater = right
        else:
            sort_data.compares.append((i, left))

        if right >= n:
            _exit = True
            greater = left
        else:
            sort_data.compares.append((i, right))
        
        if left < n and right < n:
            greater = left if array[left] > array[right] else right

        if array[i] < array[greater]:
            array[i], array[greater] = array[greater], array[i]
            sort_data.swap = (i, greater)
            data_list.append(sort_data)
            sort_data = SortData(array.copy(), None, [])
            i = greater
        else:
            data_list.append(sort_data)
            sort_data = SortData(array.copy(), None, [])
            break

        if _exit:
            break


# only implement step two, sort down
def heap_sort(array: list[int]) -> list[SortData]:
    data_list = []

    for i in range(len(array) - 1, 0, -1):
        sort_down(array, i, data_list)

    data = SortData(array.copy(), None, [])
    data_list.append(data)

    return data_list


list_3b = [9, 6, 8, 5, 4, 7, 0, 2, 3, 1]
sort_data = heap_sort(list_3b)

num_compares = sum([len(data.compares) for data in sort_data])
num_swaps = sum([1 for data in sort_data if data.swap != None])
print(f"{num_compares = }")
print(f"{num_swaps = }")

WIN_SIZE = (1200, 800)
window = Window(WIN_SIZE, vsync=True, high_dpi=True)
renderer = Renderer()
camera = Camera2D(*WIN_SIZE)
font = SysFont("Roboto Mono", 25)

clock = Timer()


def draw_hat(renderer: Renderer, left, right, y, height, flipped):
    if not flipped:
        renderer.draw_lines(
            (180, 40, 40),
            (
                (left, y + height),
                ((left + right) / 2, y + height * 1.5),
                (right, y + height),
            ),
            2,
        )
    else:
        renderer.draw_lines(
            (40, 40, 180),
            (
                (left, y - height),
                ((left + right) / 2, y - height * 1.5),
                (right, y - height),
            ),
            2,
        )


while not window.should_close():
    dt = clock.tick()

    for callback in window.get_callbacks():
        match callback:
            case KeyCallback(key, scancode, action, mods):
                if action == Action.PRESS:
                    if key == Key.ESCAPE:
                        window.close()

    if window.key_pressed(Key.DOWN):
        camera.pan.y -= 500 * dt
    if window.key_pressed(Key.UP):
        camera.pan.y += 500 * dt

    renderer.begin(view_matrix=camera.get_transform())
    renderer.clear((255, 255, 255))

    for i, data in enumerate(sort_data):
        # convert list of int to string with spaces, length of 2 at least
        text = " ".join([str(x).ljust(2) for x in data.array])

        y = 750 - i * 50
        renderer.draw_text(font, text, (50, y), (0, 0, 0))
        if data.swap != None:
            left = 57 + 45.3 * data.swap[0]
            right = 57 + 45.3 * data.swap[1]
            draw_hat(renderer, left, right, y + 10, 15, False)
        for i, compare in enumerate(data.compares):
            left = 57 + 45.3 * compare[0] - 2
            right = 57 + 45.3 * compare[1] + 2
            draw_hat(renderer, left, right, y + 10, 15, True)

    renderer.end()
    window.update()

window.destroy()
