int foo(int op)(int a, int b)
{
    version(X86)
    {
    const OP = (op == '+') ? "add" : "sub";
    asm { naked; }
    mixin("asm{"~OP~" EAX, [ESP+4];}");
    asm { ret 4; }
    }
    else static assert(0, "todo");
}

void main()
{
        int i = foo!('+')(2, 4);
        assert(i == 6);
        i = foo!('-')(2, 4);
        assert(i == 2);
}