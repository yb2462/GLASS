#include <cstdint>
#include <cooperative_groups.h>
namespace cgrps = cooperative_groups;

template <typename T>
__device__
void axpy(std::uint32_t n, 
          T alpha, 
          T *x, 
          T *y, 
          cgrps::thread_group g = cgrps::this_thread_block())
{
    for(std::uint32_t ind = g.thread_rank(); ind < n; ind += g.size()){
        y[ind] = alpha * x[ind] + y[ind];
    }
}

template <typename T>
__device__
void axpy(std::uint32_t n, 
          T alpha, 
          T *x, 
          T *y, 
          T *z, 
          cgrps::thread_group g = cgrps::this_thread_block())
{
    for(std::uint32_t ind = g.thread_rank(); ind < n; ind += g.size()){
        z[ind] = alpha * x[ind] + y[ind];
    }
}
