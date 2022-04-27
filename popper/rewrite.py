from .core import Literal, Clause

class Rewriter:
    def __init__(self, higher_order_preds):
        # FIXME: should probably keep track of arity as well
        self.higher_order_preds = set(pred_name for (pred_name, _arity) in higher_order_preds)

    def rewrite(self, program):
        if self.needs_higher_order_rewrite(program):
            program = self.higher_order_rewrite(program)
        return program

    def needs_higher_order_rewrite(self, program):
        return any('__' in lit.predicate and \
                   lit.predicate.split('__')[0] in self.higher_order_preds \
                   for _head, body in program \
                   for lit in body)

    def higher_order_rewrite(self, program):
        def rewrite_literal(lit):
            ho_pred_name = lit.predicate.split('__')[0]
            ho_encoded_args = lit.predicate.split('__')[1:]
            ho_args = ((int(pos_pred_name[0]), pos_pred_name[1:]) \
                       for pos_pred_name in ho_encoded_args)
            fo_args = iter(lit.arguments)
            new_args = []
            fo_arg = next(fo_args, None)
            ho_arg = next(ho_args, None)
            for arg_pos in range(len(lit.arguments) + len(ho_encoded_args)):
                if ho_arg is not None and ho_arg[0] == arg_pos:
                    new_args.append(ho_arg[1])
                    ho_arg = next(ho_args, None)
                else:
                    assert fo_arg is not None
                    new_args.append(fo_arg)
                    fo_arg = next(fo_args, None)
                
            return Literal(ho_pred_name, tuple(new_args)) # NB: doesn't copy over other attributes of lit

        rewritten_clauses = []
        for clause in program:
            head, body = clause
            def lits():
                for lit in body:
                    if '__' in lit.predicate and \
                            lit.predicate.split('__')[0] in self.higher_order_preds:
                        yield rewrite_literal(lit)
                    else:
                        yield lit

            rewritten_clauses.append((head, tuple(lits())))

        return tuple(rewritten_clauses)
