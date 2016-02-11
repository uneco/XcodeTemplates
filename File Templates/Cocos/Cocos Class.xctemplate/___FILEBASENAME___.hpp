#pragma once

#include "cocos2d.h"
#include "create_func.h"

class ___FILEBASENAME___ : public cocos2d::Ref, create_func<___FILEBASENAME___>
{
public:
    ___FILEBASENAME___();
    virtual ~___FILEBASENAME___();

    bool init();
    
    using create_func::create;
};
