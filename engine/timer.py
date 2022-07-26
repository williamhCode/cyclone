import time

class Timer:

    def __init__(self):
        self.time = time.perf_counter()
        self.unprocessed = 0
        self.prev_time = time.perf_counter()
        self.fps_list = []

    def tick(self, fps=None):
        if fps != None:
            frame_cap = 1 / fps

            while True:

                if self.unprocessed >= frame_cap:
                    self.unprocessed -= frame_cap
                    break

                time_2 = time.perf_counter()
                self.unprocessed += time_2 - self.time
                self.time = time_2

                time.sleep(0.00005)

        if self.unprocessed > 0.1:
            self.unprocessed -= 0.1

        curr_time = time.perf_counter()
        dt = curr_time - self.prev_time
        self.prev_time = curr_time

        if dt != 0:
            self.fps_list.append(1 / dt)
            if len(self.fps_list) > 50:
                self.fps_list.pop(0)

        return dt

    def get_fps(self):
        length = len(self.fps_list)
        if length == 0:
            return 0
        return sum(self.fps_list) / length
