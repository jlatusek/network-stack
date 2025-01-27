#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "network-stack" ? 0 : 1;
}
