# 🎩 mr.vim

_mr.vim_ (mr) is a plugin to asynchronously record MRU (Most Recently Used) and MRW (Most Recently Written) files.
It also provides commands to list MRU/MRW in quickfix.

The original idea of MRW comes from https://github.com/rbtnn/vim-mrw.

## Usage

Use `Mru` or `Mrw` command like:

```
:Mru
:Mrw
```

Or use these command with `| copen` to open quickfix automatically like:

```
:Mru | copen
:Mrw | copen
```

### Function

Use `mr#mru#list()` or `mr#mrw#list()` to list most recently read/written files.

```
:echo mr#mru#list()
:echo mr#mrw#list()
```
