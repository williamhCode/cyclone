cdef extern from "stb_image.h":
    ctypedef unsigned char stbi_uc

    void stbi_set_flip_vertically_on_load(int flag_true_if_should_flip)

    stbi_uc *stbi_load(const char *filename, int *x, int *y, int *num_channels_in_file, int num_desired_channels)

    void stbi_image_free(void *retval_from_stbi_load)
