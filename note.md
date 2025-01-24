# CUDA
## CUDA threaded blocks assignment
* map thread blocks to CUDA cores using dynamic scheduling policy

* **A warp** is that different contexts that happens to run the same instruction.

## Persistent thread
code in *data parallel* way, instead of the sheduling strategy
You can fill all the thread with `__shared__`, `while(1) {if (id == 0) idx += block}`...(See in ppt)

## There are smater assignment strategy
* CUDA is dynamic assignment
  * there is a queue between CPU and GPU, kernel says 'give me more'****
  * assign more once a time -> save locker
  * the bigger stask first
* SIPC is static assignment