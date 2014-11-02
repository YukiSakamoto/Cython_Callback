#include "backend.hpp"

Callback::Callback()
    :is_cython_call_(true)
{}

Callback::Callback(method_type method, void *user_data)
    :is_cython_call_(true), method_(method), user_data_(user_data)
{}

Callback::~Callback()
{}

double Callback::cy_execute(void *parameter)
{
    return this->method_(parameter, user_data_);
}
