from libc.stddef import ptrdiff_t

cdef extern from "<iterator>" namespace "std":
    cppclass iterator_traits[T]:
        ctypedef difference_type
        ctypedef value_type
        ctypedef pointer
        ctypedef reference
        ctypedef iterator_category

    InputIt next[InputIt] (InputIt, iterator_traits[InputIt].difference_type)
    # InputIt next[InputIt] (InputIt)
    # InputIt next[InputIt] (InputIt, ...)
    BidirIt prev[BidirIt] (BidirIt, ...)
    void advance(...)

    iterator_traits[InputIt].difference_type distance[InputIt] (InputIt, InputIt)
