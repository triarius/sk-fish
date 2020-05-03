Sk-Fish
===

Integrate [skim](https://github.com/lotabout/skim) functionality into [fish](https://github.com/fish-shell/fish-shell)!
Includes handy functions to do the following using `sk`.

- command tab completion
- search command history
- find and cd into sub-directories
- find and open files

All functions

- are lazily-loaded to keep shell startup time down
- have preset but configurable key bindings

Heavily adapted from @hauleth's PR and [jethrokuan/fzf](https://github.com/jethrokuan/fzf).

Note that the `sk` utility has its [own out-of-the-box fish package](https://github.com/lotabout/skim/blob/master/shell/key-bindings.fish). What sets this package apart is that it has a couple more integrations, most notably tab completion, and will probably be updated more frequently. They are not compatible so either use one or the other.

# Installation

With [fisher]

```
fisher add triarius/sk-fish
```

With [oh-my-fish]

```
omf install https://github.com/triarius/sk-fish
```

# Requirements

- [fish](https://github.com/fish-shell/fish-shell) `>=2.4.0`
- [sk](https://github.com/lotabout/skim) `>=0.6.0`

# About the sk binary

This package will fail if the `sk` binary is not detected in your `PATH`.

See the [sk documentation](https://github.com/junegunn/sk#installation) for instructions to install `sk` on your system.

# Usage

| Legacy      | New Keybindings | Remarks                                         |
| ----------- | --------------- | ----------------------------------------------- |
| Ctrl-t      | Ctrl-o          | Find a file.                                    |
| Ctrl-r      | Ctrl-r          | Search through command history.                 |
| Alt-c       | Alt-c           | cd into sub-directories (recursively searched). |
| Alt-Shift-c | Alt-Shift-c     | cd into sub-directories, including hidden ones. |
| Ctrl-o      | Alt-o           | Open a file/dir using default editor ($EDITOR)  |
| Ctrl-g      | Alt-Shift-o     | Open a file/dir using xdg-open or open command  |

Legacy keybindings are kept by default, but these have conflict with
keybindings in fish 2.4.0. If you want to use the new keybindings,
enter the following into your terminal:

```
set -U SKIM_LEGACY_KEYBINDINGS 0
```

NOTE: On OS X, Alt-c (Option-c) types ç by default. In iTerm2, you can
send the right escape sequence with Esc-c. If you configure the option
key to act as +Esc (iTerm2 Preferences > Profiles > Default > Keys >
Left option (⌥) acts as: > +Esc), then alt-c will work for sk as
documented.

# Commands

| Variable                       | Remarks                                                     | Example                                                       |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------- |
| `SKIM_FIND_FILE_COMMAND`        | Modify the command used to generate the list of files       | `set -U SKIM_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"` or `set -U SKIM_FIND_FILE_COMMAND "fd --type f . \$dir"` (`$dir` represents the directory being completed) |
| `SKIM_CD_COMMAND`               | Similar to ^                                                | Similar to ^                                                  |
| `SKIM_CD_WITH_HIDDEN_COMMAND`   | Similar to ^                                                | Similar to ^                                                  |
| `SKIM_OPEN_COMMAND`             | Similar to ^                                                | Similar to ^                                                  |
| `SKIM_PREVIEW_FILE_CMD`     | Modify the command used to generate preview of files.       | `set -U SKIM_PREVIEW_FILE_CMD "head -n 10"`                |
| `SKIM_PREVIEW_DIR_CMD`      | Modify the command used to generate preview of directories. | `set -U SKIM_PREVIEW_DIR_CMD "ls"`                        |

# Variables

| Variable                    | Remarks                                                       | Example                                               |
| --------------------------- | ------------------------------------------------------------- | ----------------------------------------------------- |
| `SKIM_DEFAULT_OPTS`          | Default options passed to every sk command                   | `set -U SKIM_DEFAULT_OPTS "--height 40"`               |
| `SKIM_FIND_FILE_OPTS`        | Pass in additional arguments to the sk command for find file | `set -U SKIM_FIND_FILE_OPTS "--reverse --inline-info"` |
| `SKIM_CD_OPTS`               | Similar to ^                                                  | Similar to ^                                          |
| `SKIM_CD_WITH_HIDDEN_OPTS`   | Similar to ^                                                  | Similar to ^                                          |
| `SKIM_REVERSE_ISEARCH_OPTS`  | Similar to ^                                                  | Similar to ^                                          |
| `SKIM_OPEN_OPTS`             | Similar to ^                                                  | Similar to ^                                          |
| `SKIM_COMPLETE_OPTS`         | Similar to ^                                                  | Similar to ^                                          |
| `SKIM_TMUX`                  | Runs a tmux-friendly version of sk instead.                  | `set -U SKIM_TMUX 1`                                   |
| `SKIM_ENABLE_OPEN_PREVIEW`   | Enable preview window open command.                           | `set -U SKIM_ENABLE_OPEN_PREVIEW 1`                    |

# Sk-Fish Tab Completions
TODO: fix for sk
This package ships with a `fzf` widget for fancy tab completions.
Please see [the wiki page](https://github.com/jethrokuan/fzf/wiki/SKIM-Tab-Completions) for details.

##
[tmux]: https://tmux.github.io/
[fisher]: https://github.com/jorgebucaran/fisher
[oh-my-fish]: https://github.com/oh-my-fish/oh-my-fish

# License

sk-fish is MIT licensed. See the [LICENSE](LICENSE.md) for details.
