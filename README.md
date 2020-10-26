# 🎩 mr.vim

_mr.vim_ (mr) is a plugin to asynchronously record MRU (Most Recently Used) and MRW (Most Recently Written) files.

### Function

Use `mr#mru#list()` or `mr#mrw#list()` to list most recently read/written files.

```
:echo mr#mru#list()
:echo mr#mrw#list()
```

### Special thanks

The original idea of MRW comes from https://github.com/rbtnn/vim-mrw.
