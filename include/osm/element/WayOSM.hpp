/**
* @file WayOSM.hpp
* @brief Way is a basic element into OSM.
*/

#ifndef _WAY_OSM_HPP_
#define _WAY_OSM_HPP_

#include <vector>

#include "NodeOSM.hpp"

class WayOSM
{
  public:

    WayOSM();
    virtual ~WayOSM();

  private:

    std::vector<NodeOSM *> nodes; /**< Way is composed by nodes.*/
    bool isArea;  /**< If the initial point and the final point are the same.*/
};

#endif
