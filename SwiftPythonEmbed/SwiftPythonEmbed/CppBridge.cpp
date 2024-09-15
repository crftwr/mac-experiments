//
//  CppBridge.cpp
//  SwiftPythonEmbed
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

#include <stdio.h>

#include "Python.h"

#include "CppBridge.hpp"


int HelloFuncC( int n )
{
    printf( "Hello From C : n=%d\n", n );
    return n+1;
}

int HelloFuncCpp( int n )
{
    printf( "Hello From C++ : n=%d\n", n );
    return n+1;
}

// ---

HelloClass::HelloClass(int _base)
    :
    base(_base)
{
    printf("HelloClass constructor\n");
    
    base = _base;
}

HelloClass::~HelloClass()
{
    printf("HelloClass destructor\n");
}

int HelloClass::SayHello(int n)
{
    printf( "Hello From HelloClass : n=%d\n", n );
    return n+base;
}

// ------------------------------------------

static PyObject *SpamError;

static PyObject *
spam_system(PyObject *self, PyObject *args)
{
    const char *command;
    int sts;

    if (!PyArg_ParseTuple(args, "s", &command))
        return NULL;
    sts = system(command);
    if (sts < 0) {
        PyErr_SetString(SpamError, "System command failed");
        return NULL;
    }
    return PyLong_FromLong(sts);
}

static PyMethodDef SpamMethods[] = {
    {"system",  spam_system, METH_VARARGS,
     "Execute a shell command."},
    {NULL, NULL, 0, NULL}        /* Sentinel */
};

static struct PyModuleDef spammodule = {
    PyModuleDef_HEAD_INIT,
    "spam",   /* name of module */
    NULL, /* module documentation, may be NULL */
    -1,       /* size of per-interpreter state of the module,
                 or -1 if the module keeps state in global variables. */
    SpamMethods
};

PyMODINIT_FUNC
PyInit_spam(void)
{
    PyObject *m;

    m = PyModule_Create(&spammodule);
    if (m == NULL)
        return NULL;

    SpamError = PyErr_NewException("spam.error", NULL, NULL);
    Py_XINCREF(SpamError);
    if (PyModule_AddObject(m, "error", SpamError) < 0) {
        Py_XDECREF(SpamError);
        Py_CLEAR(SpamError);
        Py_DECREF(m);
        return NULL;
    }

    return m;
}

PythonEmbed::PythonEmbed()
{
    if (PyImport_AppendInittab("spam", PyInit_spam) == -1) {
        fprintf(stderr, "Error: could not extend in-built modules table\n");
        exit(1);
    }
    
    Py_Initialize();
}
    
PythonEmbed::~PythonEmbed()
{
}
    
int PythonEmbed::CallFunc()
{
    const char * script = "print('Hello from Python code')";
    PyRun_SimpleString(script);
    
    return 0;
}
