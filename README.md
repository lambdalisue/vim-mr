# 🎩 vim-mr

_vim-mr_ (mr) is a plugin to asynchronously record MRU (Most Recently Used files), MRW (Most Recently Written files), MRR (Most Recent git Repositories), or MRD (Most Recent Directories).

### Function

Use `mr#mru#list()`, `mr#mrw#list()`, `mr#mrr#list()`, or `mr#mrd#list()` to list MRU/MRW/MRR/MRD like:

```
:echo mr#mru#list()
:echo mr#mrw#list()
:echo mr#mrr#list()
:echo mr#mrd#list()
```

If you want to delete a filename from each list:

```
:call mr#mru#delete("foo.txt")
:call mr#mrw#delete("foo.txt")
:call mr#mrr#delete("foo.txt")
:call mr#mrd#delete("foo.txt")
```

### Special thanks

The original idea of MRW comes from https://github.com/rbtnn/vim-mrw.
