# 🎩 mr.vim

_mr.vim_ (mr) is a plugin to asynchronously record MRU (Most Recently Used files), MRW (Most Recently Written files), or MRR (Most Recent git Repositories.)

### Function

Use `mr#mru#list()`, `mr#mrw#list()`, or `mr#mrr#list()` to list MRU/MRW/MRR like:

```
:echo mr#mru#list()
:echo mr#mrw#list()
:echo mr#mrr#list()
```

### Special thanks

The original idea of MRW comes from https://github.com/rbtnn/vim-mrw.
