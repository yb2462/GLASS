/**
 * @brief Sets all the elements of the array to a single value.
 *
 * @param  std::unit32_t n: size of the array
 * @param T* s_A: a matrix layed out in 1D array.
 * @param  std::unit32_t c: the const
 * 
 */


#include <cstdint>
#include <cooperative_groups.h>
namespace cgrps = cooperative_groups;

template <typename T>
__device__
void copy(std::uint32_t n, 
          T* s_A,
          std::unit32_t c,
          cgrps::thread_group g = cgrps::this_thread_block()) 
 {
    for(std::unit32_t ind = g.thread_rank(); ind < n; ind +=g.zise()) {
        
        s_A[ind] = c;
    }
}
          
