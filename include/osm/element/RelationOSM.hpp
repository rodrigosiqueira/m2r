/**
* @file RelationOSM.hpp
* @brief Relation represents one of the basic elements in OSM.
*/

#ifndef _RELATION_HPP_
#define _RELATION_HPP_

#include <vector>
#include <string>

#include "NodeOSM.hpp"
#include "WayOSM.hpp"

/**
* @class RelationOSM
* @brief Relations are used to explain how the elements work together.
*/
class RelationOSM
{
  public:

    RelationOSM();
    virtual ~RelationOSM();
 
  private:

    std::vector<NodeOSM *> nodeRelation;
    std::vector<WayOSM *> wayRelation;
    
};

#endif
