from cython.operator cimport (
    dereference as deref, preincrement as inc, predecrement as dec
)


cdef void convert_mat4(py_mat, mat4 mat):
    cdef size_t i, j
    for i in range(4):
        for j in range(4):
            mat[i][j] = py_mat[i][j]


cdef struct Node:
    size_t index
    Node *prev
    Node *next


# appends new node to current node (end), and returns new node
# if head is NULL, sets head to new node
# cdef Node *node_append(Node **head, Node *curr, size_t index):
#     cdef Node *new = <Node *>malloc(sizeof(Node))
#     new.index = index
#     new.prev = curr
#     new.next = NULL
#     if curr != NULL:
#         curr.next = new
#     if head[0] == NULL:
#         head[0] = new
#     return new


cdef Node *node_append(Node **head_ptr, size_t index):
    cdef Node *new = <Node *>malloc(sizeof(Node))
    new.index = index
    new.next = NULL
    if head_ptr[0] == NULL:
        new.prev = NULL
        head_ptr[0] = new
        return new
    cdef Node *last = head_ptr[0]
    while last.next != NULL:
        last = last.next
    last.next = new
    new.prev = last
    return new


cdef Node *node_prepend(Node **head_ptr, size_t index):
    cdef Node *new = <Node *>malloc(sizeof(Node))
    new.index = index
    new.prev = NULL
    new.next = head_ptr[0]
    if head_ptr[0] != NULL:
        head_ptr[0].prev = new
    head_ptr[0] = new
    return new


cdef Node *node_pop(Node **head_ptr):
    cdef Node *curr = head_ptr[0]
    if curr != NULL:
        head_ptr[0] = curr.next
        if curr.next != NULL:
            curr.next.prev = NULL
        curr.next = NULL
    return curr


# removes node with value from linked list, and returns the removed node
# updates head if necessary
cdef Node *node_remove(Node **head_ptr, size_t value):
    cdef Node *curr = head_ptr[0]
    while curr != NULL:
        if curr.index == value:
            if curr.prev != NULL:
                curr.prev.next = curr.next
            if curr.next != NULL:
                curr.next.prev = curr.prev
            if curr == head_ptr[0]:
                head_ptr[0] = curr.next
            return curr
        curr = curr.next
    return NULL


cdef Node *node_remove_len(Node **head_ptr, size_t value, size_t length):
    cdef Node *curr = head_ptr[0]
    cdef size_t i
    for i in range(length):
        if curr.index == value:
            if curr.prev != NULL:
                curr.prev.next = curr.next
            if curr.next != NULL:
                curr.next.prev = curr.prev
            if curr == head_ptr[0]:
                head_ptr[0] = curr.next
            return curr
        curr = curr.next
    return NULL


cdef Node *node_free(Node **head_ptr):
    cdef Node *curr_node = head_ptr[0]
    cdef Node *temp
    while curr_node != NULL:
        temp = curr_node.next
        free(curr_node)
        curr_node = temp
    head_ptr[0] = NULL


cdef Node *node_free_len(Node **head_ptr, size_t length):
    cdef Node *curr_node = head_ptr[0]
    cdef Node *temp
    for i in range(length):
        temp = curr_node.next
        free(curr_node)
        curr_node = temp
    head_ptr[0] = NULL


cdef Node *node_get(Node *head, size_t value):
    cdef Node *curr = head
    while curr != NULL:
        if curr.index == value:
            return curr
        curr = curr.next
    return NULL


cdef bint node_contains(Node *head, size_t value):
    cdef Node *curr = head
    while curr != NULL:
        if curr.index == value:
            return True
        curr = curr.next
    return False


cdef void node_print(Node *head):
    cdef Node *curr = head
    while curr != NULL:
        printf("%d, ", curr.index)
        curr = curr.next


# counter clockwise rotation
cdef bint node_is_convex(Node *node, vec2 *points):
    cdef vec2 p0 = points[node.prev.index]
    cdef vec2 p1 = points[node.index]
    cdef vec2 p2 = points[node.next.index]

    cdef float area_sum = (
        p0[0] * (p1[1] - p2[1]) +
        p1[0] * (p2[1] - p0[1]) +
        p2[0] * (p0[1] - p1[1])
    )
    return True if area_sum > 0 else False


cdef bint point_in_triangle(vec2 p, vec2 p0, vec2 p1, vec2 p2):
    cdef float A = 1/2 * (-p1[1] * p2[0] + p0[1] * (-p1[0] + p2[0]) + p0[0] * (p1[1] - p2[1]) + p1[0] * p2[1])
    cdef float sign = -1 if A < 0 else 1
    cdef float s = (p0[1] * p2[0] - p0[0] * p2[1] + (p2[1] - p0[1]) * p[0] + (p0[0] - p2[0]) * p[1]) * sign
    cdef float t = (p0[0] * p1[1] - p0[1] * p1[0] + (p0[1] - p1[1]) * p[0] + (p1[0] - p0[0]) * p[1]) * sign

    return s > 0 and t > 0 and (s + t) < 2 * A * sign


cdef bint node_is_ear(
    Node *convex_curr, Node *reflex_root, vec2 *points
):
    cdef Node *reflex_curr = reflex_root
    while reflex_curr != NULL:
        if (point_in_triangle(
            points[reflex_curr.index],
            points[convex_curr.prev.index],
            points[convex_curr.index],
            points[convex_curr.next.index]
        )):
            return False
        reflex_curr = reflex_curr.next
    return True


cdef size_t[3] *_triangulate_polygon(
    vec2 *points, size_t length, size_t *num_indices_ptr
):
    cdef size_t i

    # stores four doubly linked lists
    # 0: all vertices
    # 1: convex vertices
    # 2: reflex vertices
    # 3: ear vertices
    cdef Node *data[4]
    data = [NULL, NULL, NULL, NULL]

    # setup cylical list of vertices
    cdef Node *end = NULL
    for i in range(0, length):
        if i == length - 1:
            end = node_append(&data[0], i)
        else:
            node_append(&data[0], i)
    end.next = data[0]
    data[0].prev = end

    # setup convex and reflex list
    cdef Node *curr = data[0]
    for i in range(length):
        if node_is_convex(curr, points):
            node_append(&data[1], curr.index)
        else:
            node_append(&data[2], curr.index)
        curr = curr.next

    # setup ear list
    cdef Node *convex_curr = data[1]
    while convex_curr != NULL:
        if node_is_ear(node_get(data[0], convex_curr.index), data[2], points):
            node_append(&data[3], convex_curr.index)
        convex_curr = convex_curr.next

    cdef size_t num_indices = length - 2
    # cdef size_t num_indices = debug
    # debug = min(debug, length - 2)
    cdef size_t[3] *indices = <size_t[3] *>malloc(num_indices * sizeof(size_t[3]))

    # loop through ears and remove them
    cdef Node *curr_node
    cdef Node *adj_nodes[2]
    cdef Node *adj_node
    cdef bint is_reflex

    cdef size_t num_vertices = length
    for i in range(num_indices):
        curr_node = node_remove_len(&data[0], data[3].index, num_vertices)
        num_vertices -= 1
        free(node_pop(&data[3]))  # remove from ear list

        indices[i][0] = curr_node.prev.index
        indices[i][1] = curr_node.index
        indices[i][2] = curr_node.next.index

        adj_nodes = [curr_node.prev, curr_node.next]
        for adj_node in adj_nodes:
            if node_contains(data[3], adj_node.index):  # if is ear
                if not node_is_ear(adj_node, data[2], points):
                    free(node_remove(&data[3], adj_node.index))  # remove is not ear
                continue
            is_reflex = node_contains(data[2], adj_node.index)
            if is_reflex:  # if node is reflex
                if node_is_convex(adj_node, points):
                    free(node_remove(&data[2], adj_node.index))
                    is_reflex = False
            if (not is_reflex) and node_is_ear(adj_node, data[2], points):
                node_append(&data[3], adj_node.index)
        free(curr_node)

    # free all remaining nodes
    node_free_len(&data[0], num_vertices)
    node_free(&data[1])
    node_free(&data[2])
    node_free(&data[3])

    num_indices_ptr[0] = num_indices
    return indices


cdef set[size_t].iterator iter_prev(set[size_t].iterator iter, set[size_t]& set):
    return dec(set.end()) if iter == set.begin() else dec(iter)


cdef set[size_t].iterator iter_next(set[size_t].iterator iter, set[size_t]& set):
    return set.begin() if iter == dec(set.end()) else inc(iter)


cdef bint is_convex(
    set[size_t].iterator vertex_iter, set[size_t]& vertices, vec2 *points
):
    return _is_convex(
        points[deref(iter_prev(vertex_iter, vertices))],
        points[deref(vertex_iter)],
        points[deref(iter_next(vertex_iter, vertices))],
    )


cdef bint _is_convex(vec2 p0, vec2 p1, vec2 p2):
    cdef float area_sum = (
        p0[0] * (p1[1] - p2[1]) +
        p1[0] * (p2[1] - p0[1]) +
        p2[0] * (p0[1] - p1[1])
    )
    return True if area_sum > 0 else False


cdef void print_set(set[size_t]& vertices):
    cdef set[size_t].iterator iter = vertices.begin()
    while iter != vertices.end():
        print(deref(iter), end=', ')
        inc(iter)
    print()


cdef bint is_ear(
    set[size_t].iterator vertex_iter,
    set[size_t]& vertices,
    set[size_t]& reflex_vertices,
    vec2 *points
):
    cdef set[size_t].iterator iter = reflex_vertices.begin()
    while iter != reflex_vertices.end():
        if (point_in_triangle(
            points[deref(iter)],
            points[deref(iter_prev(vertex_iter, vertices))],
            points[deref(vertex_iter)],
            points[deref(iter_next(vertex_iter, vertices))],
        )):
            return False
        inc(iter)
    return True


cdef size_t[3] *triangulate_polygon(
    vec2 *points, size_t length, size_t *num_indices_ptr
):
    cdef size_t i

    cdef set[size_t] vertices
    cdef vector[size_t] convex_vertices
    cdef set[size_t] reflex_vertices
    cdef set[size_t] ear_vertices

    # setup list of vertices
    for i in range(0, length):
        vertices.insert(i)

    cdef int a
    # setup convex and reflex list
    cdef set[size_t].iterator iter = vertices.begin()
    for i in range(length):
        if is_convex(iter, vertices, points):
            convex_vertices.push_back(i)
        else:
            reflex_vertices.insert(i)
        # print(distance(vertices.begin(), iter))
        a = distance(vertices.begin(), iter)
        inc(iter)
        # iter = next(iter, 1)
        # prev(iter, 1)

    # setup ear list
    for i in convex_vertices:
        if is_ear(vertices.find(i), vertices, reflex_vertices, points):
            ear_vertices.insert(i)

    cdef size_t num_indices = length - 2
    cdef size_t[3] *indices = <size_t[3] *>malloc(num_indices * sizeof(size_t[3]))

    # loop through ears and remove them
    cdef set[size_t].iterator curr_iter
    cdef set[size_t].iterator adj_iters[2]
    cdef set[size_t].iterator adj_iter
    cdef bint is_reflex

    for i in range(num_indices):
        curr_iter = vertices.find(deref(ear_vertices.begin()))
        ear_vertices.erase(ear_vertices.begin())  # remove from ear list

        adj_iters = [
            iter_prev(curr_iter, vertices),
            iter_next(curr_iter, vertices)
        ]

        indices[i][0] = deref(adj_iters[0])
        indices[i][1] = deref(curr_iter)
        indices[i][2] = deref(adj_iters[1])

        vertices.erase(curr_iter)  # remove from vertices

        for adj_iter in adj_iters:
            if ear_vertices.contains(deref(adj_iter)):
                if not is_ear(adj_iter, vertices, reflex_vertices, points):
                    ear_vertices.erase(deref(adj_iter))
                continue
            is_reflex = reflex_vertices.contains(deref(adj_iter))
            if is_reflex:
                if is_convex(adj_iter, vertices, points):
                    reflex_vertices.erase(deref(adj_iter))
                    is_reflex = False
            if (not is_reflex) and is_ear(adj_iter, vertices, reflex_vertices, points):
                ear_vertices.insert(deref(adj_iter))

    num_indices_ptr[0] = num_indices
    return indices
