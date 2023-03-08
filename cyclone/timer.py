import time


class Timer:

    def __init__(self):
        self._time = time.perf_counter()
        self._unprocessed = 0
        self._prev_time = time.perf_counter()
        self._fps_list = []

    def tick(self, fps=None):
        if fps is not None:
            frame_cap = 1 / fps

            # time_2 = time.perf_counter()
            # self.unprocessed += time_2 - self.time
            # self.time = time_2
            # time.sleep(max(0, frame_cap - self.unprocessed))
            # self.unprocessed -= frame_cap

            while True:
                if self._unprocessed >= frame_cap:
                    self._unprocessed -= frame_cap
                    break

                time_2 = time.perf_counter()
                self._unprocessed += time_2 - self._time
                self._time = time_2

                time.sleep(0.0001)

        if self._unprocessed > 0.1:
            self._unprocessed -= 0.1

        curr_time = time.perf_counter()
        dt = curr_time - self._prev_time
        self._prev_time = curr_time

        if dt != 0:
            self._fps_list.append(1 / dt)
            if len(self._fps_list) > 20:
                self._fps_list.pop(0)

        return dt

    def get_fps(self):
        length = len(self._fps_list)
        if length == 0:
            return 0
        return sum(self._fps_list) / length
