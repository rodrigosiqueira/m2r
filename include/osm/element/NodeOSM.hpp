/**
* @file NodeOSM.hpp
* @brief This file is part of basic elements of OSM.
*/

#ifndef _NODE_OSM_HPP_
#define _NODE_OSM_HPP_

#include <map>
#include <string>

/**
* @class NodeOSM
* @brief Each node represents a specific point under the Earth.
*/
class NodeOSM
{
  public:

    NodeOSM();
    virtual ~NodeOSM();

  private:
    unsigned int id;  /**< An id is a unique and positive number.*/
    double latitude;  /**< Latitude follows WGS84 pattern.*/
    double longitude; /**< Longitude follows WGS84 pattern.*/
    std::map<std::string, std::string> describe; /**< Describe data element.*/
};

#endif
