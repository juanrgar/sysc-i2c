
#ifndef _CONTROLLER_H_
#define _CONTROLLER_H_

#include "systemc.h"

class controller : virtual public sc_core::sc_module
{
    public:
        controller(sc_core::sc_module_name name);
        virtual ~controller();
};

#endif // _CONTROLLER_H_
