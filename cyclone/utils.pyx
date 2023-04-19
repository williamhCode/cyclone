cdef void convert_mat4(py_mat, mat4 mat):
    cdef size_t i, j
    for i in range(4):
        for j in range(4):
            mat[i][j] = py_mat[i][j]


cdef struct Node:
    size_t index
    Node *prev
    Node *next


cdef Node *node_prepend(Node **head, size_t index):
    cdef Node *new = <Node *>malloc(sizeof(Node))
    new.index = index
    new.prev = NULL
    new.next = head[0]
    if head[0] != NULL:
        head[0].prev = new
    head[0] = new
    return new


cdef Node *node_pop(Node **head):
    cdef Node *curr = head[0]
    if curr != NULL:
        head[0] = curr.next
        if curr.next != NULL:
            curr.next.prev = NULL
        curr.next = NULL
    return curr


# removes node with value from linked list, and returns the removed node
# updates head if necessary
cdef Node *node_remove(Node **head, size_t value):
    cdef Node *curr = head[0]
    while curr != NULL:
        if curr.index == value:
            if curr.prev != NULL:
                curr.prev.next = curr.next
            if curr.next != NULL:
                curr.next.prev = curr.prev
            if curr == head[0]:
                head[0] = curr.next
            return curr
        curr = curr.next
    return NULL


cdef Node *node_remove_len(Node **head, size_t value, size_t *length):
    cdef Node *curr = head[0]
    cdef size_t i
    for i in range(length[0]):
        if curr.index == value:
            if curr.prev != NULL:
                curr.prev.next = curr.next
            if curr.next != NULL:
                curr.next.prev = curr.prev
            if curr == head[0]:
                head[0] = curr.next
            length[0] -= 1
            return curr
        curr = curr.next
    return NULL


cdef Node *node_free(Node *head):
    cdef Node *curr_node = head
    cdef Node *temp
    while curr_node != NULL:
        temp = curr_node.next
        free(curr_node)
        curr_node = temp


cdef Node *node_free_len(Node *head, size_t length):
    cdef Node *curr_node = head
    cdef Node *temp
    for i in range(length):
        temp = curr_node.next
        free(curr_node)
        curr_node = temp


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


# counter clockwise rotation
cdef bint node_is_convex(const Node *node, const vec2 *points):
    cdef vec2 p0 = points[node.prev.index]
    cdef vec2 p1 = points[node.index]
    cdef vec2 p2 = points[node.next.index]

    cdef float area_sum = (
        p0[0] * (p1[1] - p2[1]) +
        p1[0] * (p2[1] - p0[1]) +
        p2[0] * (p0[1] - p1[1])
    )
    return True if area_sum < 0 else False


cdef bint point_in_triangle(vec2 p, vec2 p0, vec2 p1, vec2 p2):
    cdef float A = 1/2 * (-p1[1] * p2[0] + p0[1] * (-p1[0] + p2[0]) + p0[0] * (p1[1] - p2[1]) + p1[0] * p2[1])
    cdef float sign = -1 if A < 0 else 1
    cdef float s = (p0[1] * p2[0] - p0[0] * p2[1] + (p2[1] - p0[1]) * p[0] + (p0[0] - p2[0]) * p[1]) * sign
    cdef float t = (p0[0] * p1[1] - p0[1] * p1[0] + (p0[1] - p1[1]) * p[0] + (p1[0] - p0[0]) * p[1]) * sign

    return s > 0 and t > 0 and (s + t) < 2 * A * sign


cdef bint node_is_ear(
    const Node *convex_curr, const Node *reflex_root, const vec2 *points
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


# triagulates by ear clipping, and returns indices matrix of length (length - 2)
cdef size_t[3] *triangulate_polygon(
    const vec2 *points, size_t length, size_t *num_indices_ptr
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
        if data[0] == NULL:
            end = node_prepend(&data[0], i)
        else:
            node_prepend(&data[0], i)
    end.next = data[0]
    data[0].prev = end

    # setup convex and reflex list
    cdef Node *curr = data[0]
    for i in range(length):
        if node_is_convex(curr, points):
            node_prepend(&data[1], curr.index)
        else:
            node_prepend(&data[2], curr.index)
        curr = curr.next

    # setup ear list
    cdef size_t num_ear_vertices = 0
    cdef Node *convex_curr = data[1]
    while convex_curr != NULL:
        if node_is_ear(node_get(data[0], convex_curr.index), data[2], points):
            node_prepend(&data[3], convex_curr.index)
            num_ear_vertices += 1
        convex_curr = convex_curr.next

    cdef size_t num_indices = length - 2
    cdef size_t[3] *indices = <size_t[3] *>malloc(num_indices * sizeof(size_t[3]))

    # loop through ears and remove them
    cdef Node *curr_node
    cdef Node *adj_nodes[2]
    cdef Node *adj_node
    cdef bint is_convex

    cdef size_t num_vertices = length
    for i in range(num_indices):
        curr_node = node_remove_len(&data[0], data[3].index, &num_vertices)
        free(node_pop(&data[3]))  # remove from ear list
        num_ear_vertices -= 1

        indices[i][0] = curr_node.prev.index
        indices[i][1] = curr_node.index
        indices[i][2] = curr_node.next.index
        adj_nodes = [curr_node.prev, curr_node.next]
        for adj_node in adj_nodes:
            is_convex = not node_contains(data[2], adj_node.index)
            if not is_convex:  # if node is reflex
                if node_is_convex(adj_node, points):
                    free(node_remove(&data[2], adj_node.index))
                    is_convex = True
            if is_convex and node_is_ear(adj_node, data[2], points):
                node_prepend(&data[3], adj_node.index)
                num_ear_vertices += 1
        free(curr_node)

    # free all remaining nodes
    node_free_len(data[0], num_vertices)
    node_free(data[1])
    node_free(data[2])
    node_free_len(data[3], num_ear_vertices)

    num_indices_ptr[0] = num_indices
    return indices
