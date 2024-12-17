from collections.abc import Callable

from xdsl.ir import Dialect


def get_all_dialects() -> dict[str, Callable[[], Dialect]]:
    """Returns all available dialects."""

    def get_arith():
        from xdsl.dialects.arith import Arith

        return Arith

    def get_builtin():
        from xdsl.dialects.builtin import Builtin

        return Builtin

    def get_func():
        from xdsl.dialects.func import Func

        return Func

    def get_linalg():
        from xdsl.dialects.linalg import Linalg

        return Linalg

    def get_memref():
        from xdsl.dialects.memref import MemRef

        return MemRef

    def get_scf():
        from xdsl.dialects.scf import Scf

        return Scf

    def get_tensor():
        from xdsl.dialects.tensor import Tensor

        return Tensor

    def get_test():
        from xdsl.dialects.test import Test

        return Test

    return {
        "arith": get_arith,
        "builtin": get_builtin,
        "func": get_func,
        "linalg": get_linalg,
        "memref": get_memref,
        "scf": get_scf,
        "tensor": get_tensor,
        "test": get_test,
    }
